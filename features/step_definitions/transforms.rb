CAPTURE_DIMENSIONS = Transform(/^(\d+) x (\d+)$/) do |width, height|
  Dimensions.new(width.to_i, height.to_i)
end

CAPTURE_POSITION = Transform(/^(\d+) (\d+) ([NSEW])$/) do |width, height, char|
  Position.new(width.to_i, height.to_i, Orientation.build(char))
end

CAPTURE_INSTRUCTIONS = Transform(/^([LRM])*$/) do |instructions|
  instructions.split('').map { |char| Instruction.build(char) }
end

CAPTURE_ROBOT = Transform(/^\w+$/) do |robot|
  robot
end
