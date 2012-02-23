p "Scope with closures and local variables"

p "The block captures the local bindings, e.g., x set to 'hello', not the caller's x,"
p "hence the name closure"

def my_method
  x = "hi"
  yield "wonderful"
end

x = "hello"
my_method {|y| "#{x}, #{y} world"} # => "hello, wonderful world"


p "Local variables"
v1 = 1
class C
  v2 = 2
  local_variables # => [:v2]

  def my_method
    v3 = 3
    local_variables # => [:v3]
  end
end
o = C.new
o.my_method
local_variables # => [:v3] # => [:v1,:o]