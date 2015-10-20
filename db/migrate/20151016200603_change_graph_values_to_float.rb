class ChangeGraphValuesToFloat < ActiveRecord::Migration
  def up
    change_table :graphs do |t|
      t.change :height, :float, :default => 0.0
      t.change :width, :float, :default => 0.0
    end
  end

  def down
  end

end
