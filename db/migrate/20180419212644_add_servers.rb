class AddServers < ActiveRecord::Migration[5.0]
  def change
    create_table :servers do |t|
      t.bigint :server_id
      t.bigint :match_channel_id
      t.date   :last_announced
      t.string :locale, default: 'en'
    end
  end
end
