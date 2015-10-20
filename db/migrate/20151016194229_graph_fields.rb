class GraphFields < ActiveRecord::Migration
  def change
    create_table :graphs do |g|
      g.decimal :height
      g.decimal :width
      g.text :fields
      g.text :data
    end
  end
end
