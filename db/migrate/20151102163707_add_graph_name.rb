class AddGraphName < ActiveRecord::Migration
  def change
    add_column :graphs, :name, :string, :default => 'humidity'
  end
end
