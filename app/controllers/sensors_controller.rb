class SensorsController < ApplicationController

  respond_to :json

  include MosquittoHelper

  def index
    @sensors = Sensor.all
    if is_mosquitto_installed? && !Rails.application.config.mosquitto_is_running
      mosquitto_sub = MosquittoSub.create(channel: "sensores")
      mosquitto_sub.subscribe
      Rails.application.config.mosquitto_is_running = true
    end
  end

  def graph
    @graph = Graph.new
    @graph.populate_graph_values
    @graph.save!
    respond_to do |format|
      format.js {}
      format.json {render json: {"x" => @graph.x_coordinates, 
                                 "y" => @graph.y_coordinates}}
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
end
