class Graph < ActiveRecord::Base

  include CollectorHelper

  serialize :x_coordinates
  serialize :y_coordinates
  serialize :temporary_coordinates

  def update_coordinates temporary_coordinates
    y_coordinate_value = median(temporary_coordinates)
    y_coordinates << y_coordinate_value
    x_coordinates << x_coordinates.last + 1
  end

  def topic_path
   return "#{Rails.root}/mosquitto_topics/" + name
  end

  def median topic_data
    sum = 0.0
    topic_data.each_with_index do |m,i|
      sum += topic_data[i]
    end
    median_value = 0.0
    median_value = sum / topic_data.length
    median_value
  end
end
