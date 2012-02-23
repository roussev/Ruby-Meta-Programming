p "NPE if person does not exist"

@person = Person.find_by_name('Kate')
puts @person ? @person.name : nil

class NilClass
  def try(*args); nil; end
end

@person.try(:name)

p "Other core extensions"

class Numeric
  KILOBYTE = 1024
  MEGABYTE = KILOBYTE * 1024
  GIGABYTE = MEGABYTE * 1024

  def bytes; self; end
  alias :byte :bytes

  def kilobytes; self * KILOBYTE; end
  alias :kilobyte :kilobytes
  # mega and giga ...
end

puts 456.megabytes # 478150656

p "Blank"

class Object
  def blank?
    respond_to?(:empty?) ? empty? : !self # !nil is true
  end

  def present?; !blank?; end
end

[1,2,3].blank? # => false
"foo".blank?   # => false
"".blank?      # true
{}.blank?      # true