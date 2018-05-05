require 'owl_bot/commands/match_announce'
require 'owl_bot/commands/ping'

module OWLBot
  module Commands
    @commands = [MatchAnnounce,
                 Ping]

    def self.include!(bot)
      @commands.each do |command|
        bot.include!(command)
      end
    end
  end
end
