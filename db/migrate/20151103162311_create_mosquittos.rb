class CreateMosquittos < ActiveRecord::Migration
  def change
    create_table :mosquittos do |t|
      t.string :host
      t.integer :port
      t.string :channel
      t.string :topic

      t.timestamps
    end
  end
end
