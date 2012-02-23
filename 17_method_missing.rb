p "Calling non-existing methods, method_missing()"

class Car
  def go(place); puts "go to #{place}"; end

  def method_missing(name, *args)
    name.to_s =~ /^go_to_(.*)/ ? go($1) : super
  end
end

car = Car.new
car.go_to_tahoe  # => go to tahoe

p "Method missing is slow"

require 'benchmark'
n = 10**6
Benchmark.bm do |x|
  x.report { n.times {car.go_to_hawaii()} }
  x.report { n.times {car.go("tahoe")} }
end

p "Li Selenium framework"

class BrowserHelper
  # ... many useful methods

  def method_missing(method_name, *args)
    if @env.selenium.respond_to?(method_name)
      @env.selenium.send(method_name, *args)
    else
      raise SeleniumMethodNotFoundException, "\"#{method_name}\" not defined in #{self.class.name}."
    end
  end
end

p "If the performance of Ghost Methods ever turns out to be a problem,"
p "we can sometimes find a middle ground. e.g., use the first call to a Ghost Method"
p "to define a Dynamic Method for the next calls. active_record uses this optimization"