class SensorsController < ApplicationController

  respond_to :json

  include MosquittoHelper

  def index
    @sensors = Sensor.all
  end

  def graph
    obj = Graph.last
    graphData = []
    graphData = format_graph_data_to_ajax(obj.x_coordinates, obj.y_coordinates)
    respond_to do |format|
      format.js {}
      format.json {render json: {'data' => graphData}}
    end
  end

  def monitor
    graph = Graph.new(y_coordinates: [0],
                      x_coordinates: [1])
    mosquitto = Mosquitto.new
    mosquitto.read_config_data
    mosquitto.save!
    mosquitto.run
    graph.save!
    graph.run_mosquitto
    graph.create_topics_dir
    graph.read_topics
    render nothing: true
  end

  def statistics
  end

  private

  def set_sensor
    @sensor = Sensor.find(params[:id])
  end

  def sensor_params
    params.require(:sensor).permit(:name, :value)
  end

  def graph_params
    params.require(:graph).permit(:x_coordinates,
                                  :y_coordinates,
                                  :name)
  end

  def mosquitto_params
    params.require(:graph).permit(:host,
                                  :port,
                                  :topic)
  end
  def format_graph_data_to_ajax x_points,y_points
    data = []
    unless y_points.blank?
      y_points.each_with_index do |y_coordinate,index|
        x_coordinate = x_points[index]
        data << [x_coordinate, y_coordinate]
      end
    end
    data
  end

end
