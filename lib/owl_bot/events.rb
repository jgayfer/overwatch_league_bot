require 'owl_bot/events/ready'

module OWLBot
  module Events
    @events = [Ready]

    def self.include!(bot)
      @events.each do |event|
        bot.include!(event)
      end
    end
  end
end
