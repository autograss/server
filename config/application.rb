require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module AutograssUserInterface
  class Application < Rails::Application
    config.after_initialize do
      graph = Graph.new( y_coordinates: [0], x_coordinates: [1])
      graph.save!
      graph.read_topics
    end
  end
end
