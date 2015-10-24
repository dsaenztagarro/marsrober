require_relative 'connectable'

# Represents a robotic rover deployed to a plateau on Mars
class Rover
  attr_reader :name, :network, :position
  include Connectable

  # @param [Hash] opts the options to create a rover
  # @option opts [String]   :name The name of the rover
  # @option opts [DSN]      :network The network channel to communicate station
  # @option opts [Planet]   :planet The planet where rover lands
  # @option opts [Position] :position The position in planet where rover lands
  # @raise UnknownNetwork if it is not provided a network
  # @raise UnknownPlanet if it is not provided a planet
  def initialize(opts)
    opts = self.class.defaults.merge(opts)
    @name = opts[:name]
    @network = opts[:network] || fail('UnknownNetwork')
    @planet = opts[:planet] || fail('UnknownPlanet')
    @position = opts[:position] || Position.zero
    @network.register(self)
    @planet.landed_by(self)
  end

  # Execute instructions received and notificates final position to station
  # @param instructions [Array<String>] Array of characters
  def listen(instructions)
    instructions.each { |cmd| break unless process_instruction(cmd) }
    @network.notify('station', @position.to_s)
  end

  private

  # Updates position of the rover with instruction passed as parameter
  # @param instruction [Instruction]
  # @return [Position] The new position. Returns nil if instruction cann't be
  #   processed
  def process_instruction(instruction)
    next_position = @position.clone.apply(instruction)
    return if @planet.obstacle?(self, next_position)
    @position = next_position
  end

  # @return [Hash] The default options on instance creation
  def self.defaults
    { position: Position.zero }
  end
end
