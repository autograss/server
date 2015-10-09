class MosquittoSub < ActiveRecord::Base

  include MosquittoHelper

  #before_create :is_mosquitto_installed?

  def subscribe
    mosquitto_flags = build_mosquitto_cmd
    run_in_shell "mosquitto_sub #{mosquitto_flags} &"
    Rails.application.config.mosquitto_is_running = true
  end

end
