module OverwatchLeagueBot
  module Commands
    module Ping
      extend Discordrb::Commands::CommandContainer
      command :ping do |_event|
        'pong'
      end
    end
  end
end
