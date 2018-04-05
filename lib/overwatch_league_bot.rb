require 'active_record'
require 'discordrb'
require 'yaml'

require_relative 'overwatch_league_bot/commands'
require_relative 'overwatch_league_bot/events'
require_relative 'overwatch_league_bot/version'

module OverwatchLeagueBot
  environment = ENV['ENV'] || 'development'
  bot_config = YAML.load_file('config/bot.yml')
  db_config = YAML.load_file('config/database.yml')

  ActiveRecord::Base.establish_connection(
    adapter: db_config[environment]['adapter'],
    database: db_config[environment]['database']
  )

  BOT = Discordrb::Commands::CommandBot.new(
    token: bot_config['token'],
    prefix: '!'
  )

  Commands.include!
  Events.include!
  BOT.run
end
