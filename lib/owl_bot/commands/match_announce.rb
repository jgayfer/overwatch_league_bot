require 'owl_bot/models/server'

module OWLBot
  module Commands
    module MatchAnnounce
      extend Discordrb::Commands::CommandContainer
      command :match_announce do |event|
        OWLBot::Models::Server.find_or_create_by(
          server_id: event.server.id,
          match_channel_id: event.channel.id
        )
        'Match announce has been enabled in this channel.'
      end
    end
  end
end
