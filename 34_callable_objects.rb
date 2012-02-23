p "Proc"

inc = Proc.new {|x| x.succ }
inc.call(2) # => 3
inc.(2)     # => 4

p "Lambda"

dec = lambda {|x| x.pred }
dec.class     # => Proc
dec.call(2)  # => 1

# Ruby provides two Kernel methods to convert a block to a Proc: lambda() and proc()

p "& operator"

def my_method(x, &block)
  y = x.succ
  yield y
end
my_method(1) {|a| a * 2} # => 4

p "Converting proc to a block"
p = Proc.new {|a| a * 2}
my_method(1, &p)         # => 4

p "Differences between procs and lambdas"
p "return in lambda returns some results, whereas in proc, it returns from the caller's context"
p "also lambdas have a strict check on the number of arguments passed"

p "The Stubby Lambda"
p = ->(x) { x + 1 } # equivalent to: p = lambda {|x| x + 1 }

p "Methods are are similar to a lambda, with an important difference:"
p "a lambda is evaluated in the scope it’s defined in (it’s a closure),"
p "while a Method is evaluated in the scope of its object."