module OverwatchLeagueBot
  module Models
    class Base < ActiveRecord::Base
      self.abstract_class = true
    end
  end
end
