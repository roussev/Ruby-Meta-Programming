p "Metaclass / Eigenclasses / Singleton class"

class C
  def my_method; end
end

obj = C.new
def obj.my_singleton_method; 1; end
obj.my_singleton_method  # => 1

obj2 = C.new
obj2.my_singleton_method # => NoMethodError: undefined method `my_singleton_method' for #<C:0x00000102424368>

p "Q: Where is my_singleton_method() defined?"
p "A: In a somewhat anonymous class, called Metaclass, wrapped by the object's class, obj -> metaclass -> class"
p "Q: Can I see it the Metaclass?"

p "Ruby has a special syntax, based on the class keyword, that places you in the scope of the metaclass"
class << obj
  # code
end

p "To get a reference to the metaclass, you can return self out of the scope"
metaclass = class << o
  self
end
metaclass.instance_methods(false) # => ["my_singleton_method"]
metaclass.inspect                 # => #<Class:#<String:0x000001023e53c0>>