p "Dynamic Proxies"
p "These objects collect method calls through method_ missing() and forward them to a wrapped object."

p "Rails, Profile.find_by_email_and_category_id('ed@test.linkedin.com', 1)"
p "method_missing delegates to DynamicFinderMatch.match(:find_by_email_and_category_id)"

class DynamicFinderMatch
  def self.match(method)
    case method.to_s
      when /^find_(all_|last_)?by_([_a-zA-Z]\w*)$/
        # ... all and last
        names = $2
      else
        return nil
    end

    names.split('_and_')
  end
end

names = DynamicFinderMatch.match("find_by_email_and_name") # => ["email", "category_id"]
all_attributes_exists?(names)
Relation.send(:find_by_attributes, names)
# => select * from profiles where email = 'ed@test.linkedin.com' and category_id = 1

def all_attributes_exists?(names)
  valid_attributes = %w(name email category_id)
  unknown_names = names - valid_attributes
  raise(ArgumentError, "Unknown name(s): #{unknown_names.join(", ")}") unless unknown_names.empty?
end