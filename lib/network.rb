# Represents a Deep Space Network
class DSN
  attr_reader :clients, :messages

  def initialize
    @clients = []
    @messages = []
  end

  def notify(receiver, message)
    client = clients.find { |item| item.name == receiver }
    client.listen(message) if client
  end

  def register(connectable)
    clients << connectable
  end
end
