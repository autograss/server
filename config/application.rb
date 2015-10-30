require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module AutograssUserInterface
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
    config.after_initialize do
      include SensorsHelper
      y_coordinate = IO.read("#{Rails.root}/graph_values/value").to_f
      graph = Graph.new( y_coordinates: [0], x_coordinates: [1])
      graph.save!

      temporary_coordinates = [y_coordinate]
      Thread.new do
        loop do
          updated_coordinate = graph.retrive_topics_data temporary_coordinates
          temporary_coordinates = updated_coordinate
          graph.save! if temporary_coordinates.empty?
          sleep(1)
        end
      end
    end
  end
end
