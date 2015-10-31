Rails.application.routes.draw do
  get 'sensors/graph', to: 'sensors#graph', :via => :get, defaults: {format: 'json'}
  post 'sensors/monitor', to: 'sensors#monitor', :via => :post
  resources :sensors
  get 'statistics', to: 'sensors#statistics' 
end
