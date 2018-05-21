module OWLBot
  module Embeds
    module MatchStart
      def self.call(match, locale = 'en')
        team1 = match.competitors.first.name.split.last
        team2 = match.competitors.last.name.split.last

        Discordrb::Webhooks::Embed.new.tap do |embed|
          embed.title = "#{Localize.('match_start', locale)} | #{team1} vs #{team2}"
        end
      end
    end
  end
end
