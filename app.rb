$LOAD_PATH.unshift(File.dirname(__FILE__) + '/lib')

require 'owl_bot'
require 'overwatch_league'
require 'active_record'
require 'yaml'

environment = ENV['ENV'] || 'development'
bot_config = YAML.load_file('config/bot.yml')
db_config = YAML.load_file('config/database.yml')

ActiveRecord::Base.establish_connection(
  adapter: db_config[environment]['adapter'],
  database: db_config[environment]['database']
)

bot = Discordrb::Commands::CommandBot.new(
  token: bot_config['token'],
  prefix: '!'
)

owl_client = OverwatchLeague.new
match_announcer = OWLBot::MatchAnnouncer.new(bot, owl_client)

OWLBot::Commands.include!(bot)
OWLBot::Events.include!(bot)

bot.run(:async)

loop do
  match_announcer.announce_live_match
  sleep 10
end
