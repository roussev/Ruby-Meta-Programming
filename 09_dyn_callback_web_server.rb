p "Dynamic Callbacks - Let's write a web framework"

require 'date'

class Server
  def initialize
    @handlers = {}
  end

  def handle(pattern, &block)
    @handlers[pattern] = block
  end

  def execute(url)
    @handlers.each do |pattern, block|
      if match = url.match(pattern)
        block.call; break
      end
    end
  end
end

server = Server.new
server.handle(/hello/) {puts "Hello at #{Date.today}"}
server.handle(/goodbye/) {puts "goodbye at #{Date.today}"}

server.execute("/hello")    #=>  Hello at 2011-03-03
server.execute("/goodbye")  #=>  goodbye at 2011-03-03