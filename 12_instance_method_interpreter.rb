p "Methods are objects too"
p "Module#instance_method returns an UnboundMethod"
p "Using Module#bind we can attach it back to an object"

class B < A # run after previous example
  define_method(:barney, instance_method(:fred))
end

class Interpreter
  def do_a() print "there, "; end
  def do_d() print "Hello ";  end
  def do_e() print "!\n";     end
  def do_v() print "Dave";    end

  Dispatcher = {
    "a" => instance_method(:do_a),
    "d" => instance_method(:do_d),
    "e" => instance_method(:do_e),
    "v" => instance_method(:do_v)
  }

  def interpret(string)
    string.each_char {|c| Dispatcher[c].bind(self).call }
  end
end

interpreter = Interpreter.new
interpreter.interpret('dave') # => Hello there, Dave!