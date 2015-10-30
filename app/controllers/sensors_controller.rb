class SensorsController < ApplicationController

  respond_to :json

  include MosquittoHelper
  include SensorsHelper

  def index
    @sensors = Sensor.all
    if is_mosquitto_installed? && !Rails.application.config.mosquitto_is_running
      mosquitto_sub = MosquittoSub.create(channel: "sensores")
      mosquitto_sub.subscribe
      Rails.application.config.mosquitto_is_running = true
    end
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
    params.require(:graph).permit(:x_coordinates, :y_coordinates, :temporary_coordinates)
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
