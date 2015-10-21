class Graph < ActiveRecord::Base

  include SensorsHelper

  serialize :x_coordinates
  serialize :y_coordinates


  def populate_graph_values
    mosquitto_loop
  end
end
