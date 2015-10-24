# Represents the value of a robotic rover over the ground
class Orientation
  attr_reader :current

  NORTH = 1
  EAST  = 2
  SOUTH = 3
  WEST  = 4

  # @param value [Fixnum] The orientation. Check constants
  # @raise [ArgumentError] If the value provided is invalid
  def initialize(value)
    fail ArgumentError unless (1..4).include? value
    @current = value
  end

  # Spins 90 degrees left
  # @return [Orientation] The new orientation
  def spin_left
    @current = case @current
               when NORTH then WEST
               when EAST then NORTH
               when SOUTH then EAST
               when WEST then SOUTH
               end
    self
  end

  # Spins 90 degrees right
  # @return [Orientation] The new orientation
  def spin_right
    @current = case @current
               when NORTH then EAST
               when EAST then SOUTH
               when SOUTH then WEST
               when WEST then NORTH
               end
    self
  end

  # @return [String] The string representation of the object
  def to_s
    %w(north east south west)[@current - 1]
  end

  # @return [String] The character representation of the orientation
  def to_char
    %w(N E S W)[@current - 1]
  end

  # @param value [String] A character: 'N' (north), 'E' (east'),
  #   'S' (south) or 'W' (west)
  # @return [Orientation] A new instance with the proper orientation
  # @raise [InvalidParamError] if the orientation provided doesn't exist
  def self.build(value)
    index = %w(N E S W).index(value)
    fail unless index
    Orientation.new(index + 1)
  end
end
