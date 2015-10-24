# Represents the dimensions of a plateau on Mars
class Dimensions
  attr_reader :width, :height

  def initialize(width, height)
    @width = width
    @height = height
  end
end
