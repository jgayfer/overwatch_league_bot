require_relative 'commands/ping'

module OverwatchLeagueBot
  module Commands
    @commands = [Ping]

    def self.include!
      @commands.each do |command|
        OverwatchLeagueBot::BOT.include!(command)
      end
    end
  end
end
