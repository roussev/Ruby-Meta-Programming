class Greeter
  def initialize(name = "World")
    @name = name
  end

  def say_hi
    puts "Hi #{@name}!"
  end

  def say_bye
    puts "Bye #{@name}, come back soon."
  end
end

g = Greeter.new("Pat")
g.say_hi         # => Hi Pat!
g.say_bye        # => Bye Pat, come back soon.
g.public_methods # => [:class, :singleton_class, ...]
g.public_methods(false) # => [:say_hi, :say_bye]
g.respond_to?(:name)    # => false
g.respond_to?(:say_hi)  # => true

# Open Class spell
class Greeter; attr_accessor :name; end

g = Greeter.new("Andy") # => #<Greeter:0x00000100d073b0 @name="Andy">
g.respond_to?("name")   # => true
g.name                  # => "Andy"
g.name = "Betty"
g.public_methods(false) # => [:say_hi, :say_bye, :name, :name=]
g.send :name=, "Kate"   # => "Kate"