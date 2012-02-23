p "Generative programming"
p "Creating methods dynamically with Module#define_method(name){block} or define_method(name, method)"

class C
  define_method :triple do |arg|
    arg * 3
  end
end

C.new.triple(2) # => 6

class A
 def fred; puts "Fred"; end

 def create_method(name, &block)
   self.class.send(:define_method, name, &block)
 end

 define_method(:wilma) { puts "Wilma" }
end

A.new.create_method(:betty) { p "Betty" }
A.public_instance_methods(false) # => [:fred, :create_method, :wilma, :betty]