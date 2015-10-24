# Represents the position of a robotic rover over the plateau of Mars
class Position
  attr_reader :height, :width

  # @param width [Fixnum]
  # @param height [Fixnum]
  # @param orientation [Orientation]
  def initialize(width, height, orientation)
    @width = width
    @height = height
    @orientation = orientation
  end

  # Applies instruction over it
  # @param instruction [Instruction]
  def apply(instruction)
    send "apply_#{instruction}"
  end

  # Initializes copy of object for DEEP copy
  def initialize_copy(source)
    super
    @orientation = @orientation.dup
  end

  # @return [String] The string representation of the position
  def to_s
    "#{@width} #{@height} #{@orientation.to_char}"
  end

  # @param position [Position]
  # @return [Boolean] Marks whether two positions have equal coordinates
  def eql_coordinates?(position)
    height == position.height && width == position.width
  end

  # @return [Position] The root position for all grids
  def self.zero
    Position.new(0, 0, Orientation.build('N'))
  end

  private

  # Instruction commands

  def apply_spin_left
    @orientation.spin_left
    self
  end

  def apply_spin_right
    @orientation.spin_right
    self
  end

  def apply_move_forward
    send "move_forward_#{@orientation}"
    self
  end

  # Orientation commands

  def move_forward_north
    @height += 1
  end

  def move_forward_east
    @width += 1
  end

  def move_forward_south
    @height -= 1
  end

  def move_forward_west
    @width -= 1
  end
end
