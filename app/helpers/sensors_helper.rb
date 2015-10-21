module SensorsHelper

  def mosquitto_loop
    Thread.new do
      loop do
        initialize_data
        sleep(2)
      end
    end
  end

  def initialize_data

    if self.x_coordinates.blank?
      self.x_coordinates = []
      self.x_coordinates << 1
    else
      self.x_coordinates << self.x_coordinates.last + 1
    end

    self.y_coordinates ||= []
    self.y_coordinates << IO.read("#{Rails.root}/graph_values/value").to_f
    puts self.x_coordinates
    puts self.y_coordinates
  end
end
