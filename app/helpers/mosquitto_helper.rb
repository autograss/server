module MosquittoHelper

  class Application < Rails::Application
    config.mosquitto_is_running = false
  end

  def mosquitto_flags
    {
      "host" => ['-h', self.host],
      "port" => ['-p', self.port],
      "channel" =>['-t', self.channel]
    }
  end

  def build_mosquitto_cmd
    cmd = ""
    mosquitto_flags.each do |flag|
      flag = flag[1][0]
      flag_value = flag[1][1]
      cmd << "#{flag} #{flag_value}"
    end
    puts "="*80 + cmd
    cmd
  end

  def is_mosquitto_installed?
    run_in_shell "which mosquitto"
  end

  def run_in_shell cmd
    system("#{cmd}")
  end

end
