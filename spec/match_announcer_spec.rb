require 'overwatch_league'
require_relative 'mocks/bot_mock'

RSpec.describe OWLBot::MatchAnnouncer do
  let(:client) { OverwatchLeague.new }
  let(:bot) { BotMock.new }
  let(:match_announcer) { OWLBot::MatchAnnouncer.new(bot, client) }
  let(:match_in_progress) { fixture('match_in_progress.json').chomp }
  let(:match_not_started) { fixture('match_not_started.json').chomp }
  let(:no_match) { fixture('no_match.json').chomp }
  let(:channel_id) { 9999 }
  let(:live_match_id) { 10451 }
  let(:not_live_match_id) { 8888 }

  before(:each) { OWLBot::Models::Server.create(match_channel_id: channel_id) }
  after(:each) { OWLBot::Models::Server.delete_all }

  describe '#initialize' do
    subject { match_announcer }
    it { is_expected.to be_a OWLBot::MatchAnnouncer }
  end

  describe '#announce_live_match' do
    subject { match_announcer.announce_live_match }

    context 'when match has not started' do
      before do
        stub_request(:any, /api.overwatchleague.com/).
          to_return(status: 200, body: match_not_started)
      end

      it 'does not send any messages' do
        expect(bot).not_to receive(:send_message)
        subject
      end
    end

    context 'when there is a match in progress' do
      before do
        stub_request(:any, /api.overwatchleague.com/).
          to_return(status: 200, body: match_in_progress)
      end

      context 'first time announcing a match' do
        after { OWLBot::Models::LiveMatch.delete_all }

        it 'sends a message to the subscribed channels' do
          expect(bot).to receive(:send_message)
          subject
        end

        it 'creates a new live match' do
          subject
          expect(OWLBot::Models::LiveMatch.first.match_id).to eq live_match_id
        end
      end

      context 'when previous match has been announced' do
        before { OWLBot::Models::LiveMatch.create(match_id: not_live_match_id) }
        after { OWLBot::Models::LiveMatch.delete_all }

        it 'sends a message to the subscribed channels' do
          expect(bot).to receive(:send_message)
          subject
        end

        it 'updates the live match id' do
          subject
          expect(OWLBot::Models::LiveMatch.first.match_id).to eq live_match_id
        end
      end

      context 'current match has not been announced yet' do
        before { OWLBot::Models::LiveMatch.create(match_id: live_match_id) }
        after { OWLBot::Models::LiveMatch.delete_all }

        it 'does not send any messages' do
          expect(bot).not_to receive(:send_message)
          subject
        end
      end
    end

    context 'when there is no upcoming match' do
      before do
        stub_request(:any, /api.overwatchleague.com/).
          to_return(status: 200, body: no_match)
      end

      it 'does not send any messages' do
        expect(bot).not_to receive(:send_message)
        subject
      end
    end
  end
end
