$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'simplecov'

SimpleCov.start do
  minimum_coverage(100)
end

require 'discordrb'
require 'active_record'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: ':memory:')
ActiveRecord::Schema.verbose = false
load "db/schema.rb"
