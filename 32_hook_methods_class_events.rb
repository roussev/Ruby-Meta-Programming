p "Hook Methods"

# The object model is an eventful place. Lots of things happen there as your code runs:
# classes are inherited, modules are mixed into classes, and methods are defined, undefined,
# and removed. This program prints a notification on the screen when a class inherits from String

class String
  def self.inherited(subclass)
    puts "#{self} was inherited by #{subclass}"
  end
end
class MyString < String; end # => String was inherited by MyString

module M
  def self.included(othermod)
    puts "M was mixed into #{othermod}"
  end
end
class C; include M; end # => M was mixed into C

module M
  def self.method_added(method)
    puts "New method: M##{method}"
  end

  def my_method;
  end
end # => New method: M#my_method