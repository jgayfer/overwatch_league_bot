module OWLBot
  module Events
    module Ready
      extend Discordrb::EventContainer
      ready do
        puts 'Ready'
      end
    end
  end
end
