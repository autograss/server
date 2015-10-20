Rails.application.routes.draw do
  get 'sensors/graph', to: 'sensors#graph', :via => :get, defaults: {format: 'json'}
  resources :sensors
  get 'statistics', to: 'sensors#statistics' 
end
