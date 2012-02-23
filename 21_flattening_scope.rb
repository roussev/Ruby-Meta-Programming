p "Flattening the Scope"

p "Keywords class and def are scope gates, and as soon we walked through them,"
p "local variables fall out of scope"

var = "success"
class C
 # We want to print var here...
  def my_method
    # ..and here
  end
end

p "Replace class with something that is not a scope gate"

C = Class.new do
  puts "#{var} in the class definition!"

  define_method :my_method do
    puts "#{var} in the method!"
  end
end

C.new.my_method # => success in the method!