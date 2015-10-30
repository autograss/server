class Graph < ActiveRecord::Base

  include SensorsHelper

  serialize :x_coordinates
  serialize :y_coordinates
  serialize :temporary_coordinates

  def retrive_topics_data temporary_coordinates
    temporary_coordinates << IO.read("#{Rails.root}/graph_values/value").to_f
    if temporary_coordinates.length == 10
      y_coordinate_value = median(temporary_coordinates)
      update_graph_coordinates(y_coordinate_value)
      temporary_coordinates = []
    end
    temporary_coordinates
  end

  def median topic_data
    sum = 0
    topic_data.each_with_index do |m,i|
      sum += topic_data[i]
    end
    median_value = 0
    median_value = sum / topic_data.length
  end

  def update_graph_coordinates coordinate_value
    self.x_coordinates = self.x_coordinates << self.x_coordinates.last + 1
    self.y_coordinates = self.y_coordinates << coordinate_value
  end
end
