require 'overwatch_league'

RSpec.describe OWLBot::Embeds::MatchStart do
  let(:match) { OverwatchLeague.new.live_match.data.live_match }
  let(:match_in_progress) { fixture('match_in_progress.json').chomp }

  before do
    stub_request(:any, /api.overwatchleague.com/).
      to_return(status: 200, body: match_in_progress)
  end

  describe '.call' do
    subject { described_class.call(match) }

    it { is_expected.to be_a Discordrb::Webhooks::Embed }

    it 'has the correct title' do
      expect(subject.title).to eq 'Match start | Shock vs Dynasty'
    end
  end
end
