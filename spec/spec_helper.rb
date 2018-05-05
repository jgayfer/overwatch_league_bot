require 'simplecov'

SimpleCov.start

require 'discordrb'
require 'active_record'

Dir["#{File.dirname(__FILE__)}/../lib/owl_bot/**/*.rb"].each { |f| load(f) }

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: ':memory:')
ActiveRecord::Schema.verbose = false
load 'db/schema.rb'
