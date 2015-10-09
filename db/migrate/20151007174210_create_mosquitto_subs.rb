class CreateMosquittoSubs < ActiveRecord::Migration
  def change
    create_table :mosquitto_subs do |t|
      t.integer :host
      t.integer :port
      t.string  :channel
      t.timestamps
    end
  end
end
