class CreateSensors < ActiveRecord::Migration
  def change
    create_table :sensors do |t|
      t.string :name
      t.decimal :value

      t.timestamps
    end
  end
end
