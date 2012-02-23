p "Ghost Methods"

require 'ostruct'

li = OpenStruct.new
li.connections = ["Reid", "Jeff", "Victoria"]

p "Let's do it ourselves"

class MyOpenStruct
  def initialize
    @attributes = {}
  end

  def method_missing(name, *args)
    attribute = name.to_s
    if attribute =~ /=$/
      @attributes[attribute.chop] = args[0]
    else
      @attributes[attribute]
    end
  end
end

li = MyOpenStruct.new
li.name = "boris"
li.connections = ["Reid", "Jeff", "Victoria"]

puts li.connections