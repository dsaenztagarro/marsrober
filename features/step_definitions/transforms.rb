CAPTURE_DIMENSIONS = Transform(/^(\d+) x (\d+)$/) do |width, height|
  Dimensions.new(width.to_i, height.to_i)
end

CAPTURE_POSITION = Transform(/^(\d+) (\d+) [NSEW]$/) do |width, height, letter|
  Position.new(width.to_i, height.to_i, Orientation.build(letter))
end

CAPTURE_INSTRUCTIONS = Transform(/^[LRM]*$/) do |instructions|
  instructions.split('').map { |letter| Instruction.build(letter) }
end

CAPTURE_ROBOT = Transform(/^\w$/) do |robot|
  robot
end
