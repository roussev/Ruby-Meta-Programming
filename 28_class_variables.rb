p "Class Variables"

p "Class variables are different from Class Instance Variables,"
p "because they can be accessed by subclasses and by regular instance methods."
p "In that respect, they’re more similar to Java’s static fields."

class C
  @@v = 1
end

class D < C
  def my_method; @@v; end
end

D.new.my_method # => 1

p "Generally, Rubyists favor of Class Instance Variables over class variables because"
p "they don’t really belong to classes—they belong to class hierarchies."
p "@@v in class Object would clash with @@V in class C"

@@v = 1
class C
  @@v = 2
end
@@v #=>2