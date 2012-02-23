p "Blank slate spell"

p "A common problem with dyn proxies is name clashing"
p "Whenever a ghost method clashes with a real, inherited method, the latter wins."

p "Fix - remove the inherited method"
p "Module#undef_ method() - removes all methods, including the inherited ones"
p "Module#remove_method() - removes the method from the receiver, but not inherited ones"

class BlankSlate
  instance_methods.each { |m| undef_method m unless m =~ /^__/ }
end
BlankSlate.instance_methods # => ["__send__", "__id__"]

class Proxy < BlankSlate
  def initialize(obj)
    @obj = obj
  end

  def method_missing(sym, *args, &block)
    puts "Sending #{sym}(#{args.join(',')}) to obj"
    @obj.__send__(sym, *args, &block)
  end
end

s = Proxy.new("foo")
puts s.reverse # => oof