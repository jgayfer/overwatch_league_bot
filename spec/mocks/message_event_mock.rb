class MessageEventMock
  attr_reader :server, :channel

  def initialize(server: ServerMock.new, channel: ChannelMock.new)
    @server = server
    @channel = channel
  end
end
