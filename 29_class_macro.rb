p "Class Macros"

p "All the attr_*() methods are defined on class Module"
p "and can use them whenever self is a module or a class."

p "A method such as attr_accessor() is called a Class Macro."
p "Class Macros look like keywords, but they’re just regular class methods that"
p "are meant to be used in a class definition."

class C
  attr_accessor :attr
end

class Book
  def title; "ruby"; end

  def self.deprecate(old_method, new_method)
    define_method(old_method) do |*args, &block|
      warn "Warning: #{old_method}() is deprecated. Use #{new_method}()."
      send(new_method, *args, &block)
    end
  end

  deprecate :get_title, :title
end

Book.new.get_title # => Warning: get_title() is deprecated. Use title(). ruby
