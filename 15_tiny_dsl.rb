p "Li Selenium Framework Pages DSL"

p "The framework which nobody ever sees"
class LiPageElement < Struct.new(:name, :page_name, :locator)
end

class LiPage
  class << self
    def element(name, locator)
      define_method name do
        LiPageElement.new(name, self.class.name, locator)
      end
    end
  end

  def initialize(env)
    @env = env
  end
end

p "What the client sees"

class CapHomePage < LiPage
  element :login,        "//input[@name='login']"
  element :password,     "//input[@name='password']"
  element :form,         "//form"
end

page = CapHomePage.new("Qa")
page.login.locator            # => "//input[@name='login']"