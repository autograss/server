require 'yaml'
class Mosquitto < ActiveRecord::Base

  def run
    mosquitto_host = "-h #{host} "
    mosquitto_port = "-p #{port} "
    mosquitto_topic = "-t #{topic}"
    mosquitto_cmd_line = "mosquitto_sub " + \
                          mosquitto_host + mosquitto_port + \
                          mosquitto_topic + " &"
    run_in_shell mosquitto_cmd_line if is_mosquitto_installed?
  end

  def read_config_data
    config = YAML.load_file("#{Rails.root}/mosquitto.yaml")
    self.host = config['host']
    self.port = config['port']
    self.topic = config['topics'][0]
  end

  def is_mosquitto_installed?
    run_in_shell "which mosquitto"
  end

  def run_in_shell cmd
    system("#{cmd}")
  end
end
