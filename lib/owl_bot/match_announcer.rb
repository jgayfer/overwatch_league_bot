require 'owl_bot/embeds/match_start'
require 'owl_bot/models/live_match'
require 'owl_bot/models/server'

module OWLBot
  class MatchAnnouncer

    def initialize(bot, owl_client)
      @bot = bot
      @owl_client = owl_client
    end

    def announce_live_match
      match = find_match_to_announce || return
      send_match_start_messages(match)
      update_last_announced_match(match)
    end

    private

    def find_match_to_announce
      @owl_client.live_match.data.live_match.tap do |current_match|
        return false if current_match.to_h.empty?
        return false if !match_in_progress?(current_match) || match_announced?(current_match)
      end
    end

    def match_announced?(match)
      last_announced_match = OWLBot::Models::LiveMatch.first
      return false unless last_announced_match
      match.id == last_announced_match.match_id
    end

    def match_in_progress?(match)
      match.games.any? { |game| game.state == 'IN_PROGRESS' }
    end

    def update_last_announced_match(match)
      OWLBot::Models::LiveMatch.first_or_create.update(match_id: match.id)
    end

    def send_match_start_messages(match)
      match_embed = OWLBot::Embeds::MatchStart.call(match)
      OWLBot::Models::Server.where.not(match_channel_id: nil).each do |server|
        @bot.send_message(server.match_channel_id, '', false, match_embed)
      end
    end
  end
end
