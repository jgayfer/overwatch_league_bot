require_relative 'commands/ping'

module OWLBot
  module Commands
    @commands = [Ping]

    def self.include!
      @commands.each do |command|
        OWLBot::BOT.include!(command)
      end
    end
  end
end
