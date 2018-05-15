  class LiveMatch < ActiveRecord::Migration[5.0]
    def change
      create_table :live_matches do |t|
        t.integer :match_id
      end
    end
  end
