p "Introspection"

class Person
  attr_accessor :name, :age

  def initialize(attributes = {})
    attributes.each{|k,v| send "#{k}=", v}
    yield self if block_given?
  end
end

p = Person.new(:name => "George", :age => 21)

p = Person.new do |person|
  person.name = "Mary"
  person.age = 18
end

puts "class:                #{p.class}"
puts "class public methdos: #{p.class.public_methods(false)}"
puts "instance methods:     #{p.class.public_instance_methods(false)}"
puts "instance variables:   #{p.instance_variables}"
puts "ancestors:            #{p.class.ancestors}"
puts "responds to :name?    #{p.respond_to?(:name)}"
puts "responds to :foo?     #{p.respond_to?(:last_name)}"