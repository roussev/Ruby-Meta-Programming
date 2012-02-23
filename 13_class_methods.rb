p "Class Method syntax - three ways"

class C
  def self.my_method; end
end

def C.my_other_method; end

class C
  class << self # open the metaclass / eigenclass / singleton class and defined the new method
    def my_third_method; end
  end
end

C.public_methods(false)# => [:my_method, :my_other_method, :my_third_method]