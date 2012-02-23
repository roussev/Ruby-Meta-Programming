p "Modules"

Class.ancestors               # => [Class, Module, Object, Kernel, BasicObject]
Class.instance_methods(false) # => [:allocate, :new, :superclass]

p "Use a module when you mean it to be included somewhere (or use as a Namespace)"
p "Use a class when you mean it to be instantiated or inherited"

module Logger
  def log(message)
    $stdout.puts "#{message} at #{Time.now}"
  end
end

class Person
  include Logger
end
Person.new.log("new feature") # => new feature at 2011-04-19 22:19:58 -0700

class C
  extend Logger
end
C.log("hi") # hi at 2011-04-19 22:19:26 -0700

str = "hello"
str.extend(Logger)
str.log('hi')

c = "cast"
class << c
  include Logger
end
c.log('hi')