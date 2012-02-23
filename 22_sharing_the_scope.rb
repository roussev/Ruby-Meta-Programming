p "Sharing the Scope"

p "Q: how to share a variable among a few methods, w.o. letting anybody else see it"
p "A: Define all the methods in the same Flat Scope as the variable using Dynamic Dispatch"
p "No one else can see shared because it's protected by a Method Scope Gate"

def define_methods
  shared = 0

  Kernel.send :define_method, :counter do
    shared
  end

  Kernel.send :define_method, :inc do |x|
    shared += x
  end
end

define_methods
counter	# => 0
inc(4)
counter	# => 4