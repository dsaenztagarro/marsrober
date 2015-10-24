# Represents the common interface for devices connected to a network
# Examples: station, robotic rovers
module Connectable
  # Notify a message to other device connected to the network
  def notify(receiver, message)
    @network.notify(receiver, message)
  end

  # Listen for messages on network
  # @param message [Object]
  def listen(_)
    fail 'UnimplementedError'
  end
end
