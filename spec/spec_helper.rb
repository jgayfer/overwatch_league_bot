require 'simplecov'

SimpleCov.start

require 'webmock/rspec'
require 'discordrb'
require 'active_record'

Dir["#{File.dirname(__FILE__)}/../lib/owl_bot/**/*.rb"].each { |f| load(f) }

def fixture(file)
  File.read(fixture_path(file))
end

def fixture_path(file)
  File.join(File.expand_path('fixtures', __dir__), file)
end

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: ':memory:')
ActiveRecord::Schema.verbose = false
load 'db/schema.rb'
