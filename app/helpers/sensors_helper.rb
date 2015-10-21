module SensorsHelper

  def initialize_data graph
    if graph.x_coordinates.blank?
      graph.x_coordinates = []
      graph.x_coordinates << 1
    else
      graph.x_coordinates << graph.x_coordinates.last + 1
    end
    graph.y_coordinates ||= []
    graph.y_coordinates << IO.read("#{Rails.root}/graph_values/value").to_f
    graph.save!
  end
end
