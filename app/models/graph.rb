class Graph < ActiveRecord::Base

  include SensorsHelper

  serialize :x_coordinates
  serialize :y_coordinates

end
