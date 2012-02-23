module Mixin
  def foo; puts "foo"; end

  module ClassMethods
    def bar; puts "bar"; end
  end
end

class Person
  include Mixin
  extend Mixin::ClassMethods
end
Person.new.foo # => foo
Person.bar     # => bar

p "Use self.included hook (more about hooks later)"

module Mixin
  def self.included(base)
    base.extend(ClassMethods)
  end

  def foo; puts "foo"; end

  module ClassMethods
    def bar; puts "bar"; end
  end
end

class Person
  include Mixin
end
Person.new.foo # => foo
Person.bar     # => bar