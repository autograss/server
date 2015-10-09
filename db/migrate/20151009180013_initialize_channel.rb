class InitializeChannel < ActiveRecord::Migration
  def change
    change_table :mosquitto_subs do |t|
      t.change :channel, :string, :default => ''
    end
  end
end
