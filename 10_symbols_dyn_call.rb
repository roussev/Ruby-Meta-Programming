p "Symbols and Strings are not related"

x = :a
"test".to_sym # => :test
"test".intern # => :test
:test.to_s    # => "test"

p "Calling methods dynamically, see 02_introspection.rb"

"string".respond_to?(:length) # => true
"string".send(:length)        # => 6
1.send(:+, 2)                 # => 3
"dog".respond_to?(:bark)      # => false

p "We can call any method with Object#send including private methods (power/responsibility)"
p "Short of using a Context Probe, this is the easiest way to peek into an object’s private matters."

class C
  def m; 1; end
  private :m
end
C.new.send :m # => 1

p "More scary stuff. There is no connection b/n an object’s class and its instance variables."
p "Instance variables just spring into existence when you assign them a value."

c = C.new
c.instance_variables              # => []
c.instance_variable_set("@x", 10)
c.instance_variables              # => [:@x]
c.instance_variable_get :@x       # => 10