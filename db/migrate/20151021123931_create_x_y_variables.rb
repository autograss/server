class CreateXYVariables < ActiveRecord::Migration
  def change
    add_column :graphs, :x_coordinates, :text
    add_column :graphs, :y_coordinates, :text
  end
end
