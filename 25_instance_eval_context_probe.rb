p "Context Probe with instance_eval()"

p "A snippet of code that we dip inside an object to do something in there."
p "Evaluates a block in the context of an object with the receiver as self,"
p "so it can access the receiver’s private methods and instance variables"

class C
  def initialize
    @v = 1
  end
end

o = C.new
o.instance_eval {puts @v} # => 1

o.instance_eval { @v = 2 }
o.instance_eval { @v }	   # => 2

p "Q: Isn't this very bad?"
p "A: The most socially acceptable reason to break encapsulation is testing, RSpec"
