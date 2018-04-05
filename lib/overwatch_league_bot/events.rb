require_relative 'events/ready'

module OverwatchLeagueBot
  module Events
    @events = [Ready]

    def self.include!
      @events.each do |event|
        OverwatchLeagueBot::BOT.include!(event)
      end
    end
  end
end
