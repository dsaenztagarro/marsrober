# Represents the plateau landed by robotic rovers
class Planet
  # Error while landing on planet
  class LandingError < StandardError
  end

  # @param dimensions [Dimensions]
  def initialize(dimensions)
    @dimensions = dimensions
    @obstacles = []
  end

  def landed_by(visitor)
    fail LandingError if obstacle?(visitor, visitor.position)
    @obstacles << visitor
  end

  # @param visitor [Rover]
  # @param position [Position]
  # @return [Boolean]
  def obstacle?(visitor, position)
    return true if limits?(position)
    obstacles_without(visitor).find do |obstacle|
      obstacle.position.eql_coordinates? position
    end
  end

  private

  # @param position [Position]
  # @return [Boolean] Marks whether the position passed as parameter is inside
  #   the dimensions of the planet
  def limits?(position)
    width = position.width
    height = position.height
    width < 0 || height < 0 || width > @dimensions.width ||
      height > @dimensions.height
  end

  def obstacles_without(visitor)
    @obstacles.select { |obstacle| obstacle != visitor }
  end
end
