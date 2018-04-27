require 'owl_bot/models/server'
require 'owl_bot/localize'

module OWLBot
  module Commands
    module MatchAnnounce
      extend Discordrb::Commands::CommandContainer
      command :match_announce do |event|
        server = OWLBot::Models::Server.find_or_create_by(server_id: event.server.id)
        server.update(match_channel_id: event.channel.id)
        Localize.('match_announce_enabled', server.locale)
      end
    end
  end
end
