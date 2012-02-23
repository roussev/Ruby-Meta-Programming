p "class_eval"
p "Q: How to add dynamically a method to any class?"

def add_meth_to(klass)
  klass.class_eval do
    def m; 'Hello!'; end
  end
end
"abc".m # => "Hello!"


p "Q: How can we add a class method to all classes?"

class Class
  def foo
    puts "all classes have foo class method"
  end
end

class A; end
A.foo # all classes have foo class method

p "Deciding Between instance_eval() and class_eval()"
p "If you want to open an object that is not a class, then you can use instance_eval()."
p "If you want to open a class definition and define methods with def use class_eval()."