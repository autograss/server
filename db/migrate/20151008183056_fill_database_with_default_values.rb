class FillDatabaseWithDefaultValues < ActiveRecord::Migration

  def change
    change_table :mosquitto_subs do |t|
      t.change :host, :string, :default => '192.168.50.4'
      t.change :port, :string, :default => '13000'
    end
  end
end
