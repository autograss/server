class SensorsController < ApplicationController
  before_action :set_sensor, only: [:show, :edit, :update, :destroy]

  def index
    @sensors = Sensor.all
  end

  def statistics
  end

  def show
  end

  def new
    @sensor = Sensor.new
  end

  def edit
  end

  def create
    @sensor = Sensor.new(sensor_params)

    respond_to do |format|
      if @sensor.save
        format.html { redirect_to @sensor, notice: 'Sensor was successfully created.' }
        format.json { render :show, status: :created, location: @sensor }
      else
        format.html { render :new }
        format.json { render json: @sensor.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def set_sensor
      @sensor = Sensor.find(params[:id])
    end

    def sensor_params
      params.require(:sensor).permit(:name, :value)
    end
end
