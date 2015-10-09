class SensorsController < ApplicationController

  include MosquittoHelper

  def index
    @sensors = Sensor.all
    if is_mosquitto_installed? && !Rails.application.config.mosquitto_is_running
      mosquitto_sub = MosquittoSub.create(channel: "sensores")
      mosquitto_sub.subscribe
      Rails.application.config.mosquitto_is_running = true
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
