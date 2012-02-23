p "Self"
p "Every line of Ruby code is executed inside an object called self and can be accessed"
p "with the self keyword. Only one object can take the role of self at a given time"
p "When you call a method, the receiver becomes self."
p "From that moment on, all instance variables are instance variables of self, and all methods called without an"
p "explicit receiver are called on self."

class Demo
  puts self # => Demo

  def foo
    puts self # => <Demo:0x10180f398> object
    [1,2].each {puts self} # => <Demo:0x10180f398> object
  end

  class AnotherDemo
    puts self # => Demo::AnotherDemo
  end
end
Demo.new.foo # => <Demo:0x10180f398> object

p "Private method cannot be called on an explicit receiver"

class C
  def public_m
    self.private_m
  end

  def private_m; end
  private :private_method
end
C.new.public_method # => NoMethodError: private method `private_method' called for #<C:0x0000010121f500>
p "fix - remove self keyword"

p "Q: Can object x call a private method on object y if the two objects share the same class?"
p "A: No, we still need an explicit receiver to call another object’s method."
p "Q: Can we call a private method that we inherited from a superclass?"
p "A; Yes, because we don’t need an explicit receiver to call inherited methods."