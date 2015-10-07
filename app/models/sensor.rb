class Sensor < ActiveRecord::Base
  mattr_accessor :name, :value
end
