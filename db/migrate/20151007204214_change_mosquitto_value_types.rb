class ChangeMosquittoValueTypes < ActiveRecord::Migration
  def change
    change_table :mosquitto_subs do |t|
      t.change :host, :string
      t.change :port, :string
    end
  end
end
