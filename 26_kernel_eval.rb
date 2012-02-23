p "Bindings & Kernel#eval"

array = [10, 20]
element = 30
eval("array << element") # => [10, 20, 30]

p "Binding Objects"

p "A binding is a scope packaged as an object. We can create a binding to capture the"
p "local scope and carry it around. Later, we can execute code in that scope"
p  "using with eval(), instance_eval(), or class_eval()."

x = 1; y = 2; b = binding
eval "x + 1", b
b.instance_eval {x} # => 1

class MyClass
  def my_method
    @x = 1
    binding
  end
end
b = MyClass.new.my_method
eval "@x", b	# => 1

p "We can view Binding objects as a 'purer' form of closures than blocks, because these objects"
p "contain a scope but don’t contain code."