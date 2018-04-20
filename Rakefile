require 'yaml'
require 'logger'
require 'active_record'
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)
task :default => :spec

include ActiveRecord::Tasks

root = File.expand_path(__dir__)
DatabaseTasks.env = ENV['ENV'] || 'development'
DatabaseTasks.database_configuration = YAML.load(File.read(File.join(root, 'config/database.yml')))
DatabaseTasks.db_dir = File.join root, 'db'
DatabaseTasks.migrations_paths = [File.join(root, 'db/migrate')]
DatabaseTasks.root = root

task :environment do
  ActiveRecord::Base.configurations = DatabaseTasks.database_configuration
  ActiveRecord::Base.establish_connection DatabaseTasks.env.to_sym
end

namespace :g do
  desc "Generate migration"
  task :migration do
    name = ARGV[1] || raise("Specify name: rake g:migration your_migration")
    timestamp = Time.now.strftime("%Y%m%d%H%M%S")
    path = File.expand_path("../db/migrate/#{timestamp}_#{name}.rb", __FILE__)
    migration_class = name.split("_").map(&:capitalize).join

    File.open(path, 'w') do |file|
      file.write <<-EOF
  class #{migration_class} < ActiveRecord::Migration[5.0]
    def change

    end
  end
      EOF
    end
    puts "Migration #{path} created"
    abort
  end
end

load 'active_record/railties/databases.rake'