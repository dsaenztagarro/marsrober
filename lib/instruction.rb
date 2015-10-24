# Represents a instruction sent to the rover from station
class Instruction
  attr_reader :current

  LEFT = 1
  RIGHT = 2
  MOVE_FORWARD = 3

  # @param value [Fixnum] The instruction. Check constants
  # @raise [ArgumentError] If the value provided is invalid
  def initialize(value)
    fail ArgumentError unless (1..3).include? value
    @current = value
  end

  # @return [String] The string representation of the object
  def to_s
    %w(spin_left spin_right move_forward)[@current - 1]
  end

  # @param value [String] A character: 'N' (north), 'E' (east'),
  #   'S' (south) or 'W' (west)
  # @return [Orientation] A new instance with the proper instruction
  # @raise [InvalidParamError] if the instruction provided doesn't exist
  def self.build(value)
    index = %w(L R M).index(value)
    fail ArgumentError unless index
    Instruction.new(index + 1)
  end
end
