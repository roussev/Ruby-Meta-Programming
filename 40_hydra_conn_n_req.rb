# Data Reads

# To use parallel reads, models should never make requests themselves. (unlike ActiveRecord
# which makes connections within the data object) They can build request objects.

# The jobs gem should have an object to store configuration
class Jobs::Config
  class << self; attr_accessor :host, :hydra; end
end

# this would go in a service initializer in config/initializers/
# each service uses its own gem
HYDRA = Typhoeus::Hydra.new
Jobs::Config.hydra = HYDRA
Applicants::Config.hydra = HYDRA

Jobs::Config.host = host
Applicants::Config.host = host

# code in a controller or presenter or non-ActiveRecord model

jobs = nil
Jobs::ReadingList.for_user(1, :include => [:applicants]) do |list|
  jobs = list
end

HYDRA.run

# now the data can be used
job = jobs.first
job.title
job.applicants.first

# Finally, the call to get a list for a user requires a block to be passed in. This is because of the
# evented programming style of Typhoeus. The block is called when the request has completed.
# The important thing to note is that the request is not run by the jobs gem. The request is queued up by
# the jobs gem, but it is run outside this gem. This ensures that the hydra manager is able to run requests in parallel.

class Jobs::Job
  attr_accessor :applicants, :previous_page, :next_page

  def initialize(json, options = {})
    parsed = JSON.parse(json)
    @applicant_ids = parsed["applicant_ids"]
    @includes = options[:include]
  end

  def self.find_by_job_id(job_id, options = {}, &block)
    includes = options[:include] || []

    request = create_job_request(job_id)
    request.on_complete do |response|
      job = new(response.body, options)
      job.applicants if includes.include?(:applicants)
      yield job
    end

    HYDRA.queue(request)
  end

  def self.create_job_request(job_id)
    # ...
  end

  def applicants
    Applicants::Applicant.find_by_id(@applicant_ids) do |applicants|
      @applicants = applicants
    end
  end

  def save
    return false unless valid? # run all validator
    request = create_job_post_request()

    HYDRA.queue(request)
    HYDRA.run

    if response.code == 200
      return self
    else
      errors.add(:http_code, response.code)
      errors.add(:http_response_body, response.body)
      return nil
    end
  end
end

# Data Writes

# Normally data writes do not need to occur in parallel. Usually, a single write is performed, and errors or
# success status is immediately handed back to the caller. This means that a blocking model where the data object
# performs the request to update makes more sense.