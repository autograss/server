class Graph < ActiveRecord::Base

  include CollectorHelper

  serialize :x_coordinates
  serialize :y_coordinates
  serialize :temporary_coordinates

  def median topic_data
    sum = 0
    topic_data.each_with_index do |m,i|
      sum += topic_data[i]
    end
    median_value = 0
    median_value = sum / topic_data.length
  end

end
