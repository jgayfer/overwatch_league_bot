require 'owl_bot/events/ready'

module OWLBot
  module Events
    @events = [Ready]

    def self.include!
      @events.each do |event|
        OWLBot::BOT.include!(event)
      end
    end
  end
end
