p "Reopen Class"

class Array
  #   options(1, 2)           # => {}
  #   options(1, 2, :a => :b) # => {:a=>:b}
  def extract_options!
    last.instance_of?(Hash) ? pop : {}
  end
end

a = [1, 2]; a << {:a => 1}
a.public_methods(false).grep(/extract/) # => [:extract_options!]
a.last                                  # => {:a => 1}
a.extract_options!                      # => {:a => 1}
a.inspect                               # => "[1, 2]"

p "To sum up, the 'class' keyword acts as a scope operator"

class C
  def method_1; 'x'; end
end

class C
  def method_2; 'y'; end
end
