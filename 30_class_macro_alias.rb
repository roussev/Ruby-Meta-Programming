p "Around Alias"

p "Alias a method and then redifine it"

$http = true # read from some config

class Helper
  def self.http(method, http_method)
    return unless $http

    alias_method "#{method}_original", method

    define_method(method) do |*args, &block|
      warn "Using #{http_method} for #{method}"
      send(http_method, *args, &block)
    end
  end
end

class RegHelper < Helper
  def create_user;      "done"; end
  def http_create_user; "done"; end

  http :create_user, :http_create_user
end