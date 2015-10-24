require_relative 'connectable'

# Represents NASA station responsible for controlling a rover
class Station
  attr_reader :name, :network
  include Connectable

  def initialize(opts = {})
    opts = self.class.defaults.merge(opts)
    @messages = []
    @name = opts[:name]
    @network = opts[:network]
    @network.register(self) # Register needed in order to listen events
  end

  # Listen for messages on network
  # @param message [String]
  def listen(message)
    @messages << message
  end

  # @return [String] The summary of final rover positions
  def report
    @messages.join("\n")
  end

  def self.defaults
    { name: 'station' }
  end
end
