p "Blocks"
[1, 3, 5].collect {|n| n.succ}    # => [2, 4, 6]

{:a => 1, :b => 2}.each do |k, v|
  puts "#{k} = #{v}"
end                              # => a = 1, b = 2

def a_method
  return yield if block_given?
  'no block'
end
a_method # => "no block"
a_method { "here's a block!" } # => "here's a block!"

def call_block(&block)
  block.call("hi")
end
call_block {|arg| puts "#{arg} world"} # => hi world

p "Disposes of a resource after using it."
module Kernel
  def using(resource)
    begin
      yield
    ensure
      resource.dispose
    end
  end
end

class Resource;
  def initialize; @disposed = false; end
  def dispose;    @disposed = true; end
  def disposed?;  @disposed; end
end

r = Resource.new
r.disposed?              # => false
using(r){puts "using r"}
r.disposed?              # => true

p "You can’t define a new keyword, but you can fake it with a Kernel Method"