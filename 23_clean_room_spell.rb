p "Clean Rooms"

p "Sometimes we create an object just to evaluate blocks inside it."
p "An object like that can be called a Clean Room"

class CleanRoom
  def complex_calculation
    # ...
  end
  def do_something
  # ...
  end
end

clean_room = CleanRoom.new clean_room.instance_eval do
  if complex_calculation > 10
    do_something
  end
end