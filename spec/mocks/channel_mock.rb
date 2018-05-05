class ChannelMock
  attr_reader :id
  attr_accessor :type

  def initialize(id: 0, type: 0)
    @id = id
    @type = type
  end
end
