class SensorsController < ApplicationController

  respond_to :json

  include MosquittoHelper
  include SensorsHelper

  def index
    @sensors = Sensor.all
    @graph = Graph.new
    initialize_data @graph
    @graph.save!
    if is_mosquitto_installed? && !Rails.application.config.mosquitto_is_running
      mosquitto_sub = MosquittoSub.create(channel: "sensores")
      mosquitto_sub.subscribe
      Rails.application.config.mosquitto_is_running = true
    end
  end

  def graph
    respond_to do |format|
      format.js {}
      format.json {render json: {"x" => Graph.last.x_coordinates, 
                                 "y" => Graph.last.y_coordinates}}
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
    params.require(:graph).permit(:x_coordinates, :y_coordinates)
  end
end
