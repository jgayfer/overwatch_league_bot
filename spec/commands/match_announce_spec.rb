require 'owl_bot/commands/match_announce'

require_relative '../mocks/channel_mock'
require_relative '../mocks/message_event_mock'
require_relative '../mocks/server_mock'

match_announce = OWLBot::Commands::MatchAnnounce.commands[:match_announce]. \
  instance_variable_get('@block')

RSpec.describe String do
  let(:channel_id) { 123 }
  let(:server_id) { 456 }
  let(:channel) { ChannelMock.new(id: channel_id) }
  let(:server) { ServerMock.new(id: server_id) }
  let(:event) { MessageEventMock.new(server: server, channel: channel) }

  describe '#call' do
    subject { match_announce.call(event, []) }
 
    it 'returns the correct text' do
      expect(subject).to eq 'Match announce has been enabled in this channel.'
    end

    it 'updates the match channel id' do
      subject
      server = OWLBot::Models::Server.find_by(server_id: server_id)
      expect(server.match_channel_id).to eq channel_id
    end
  end
end
