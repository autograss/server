Rails.application.routes.draw do
  resources :sensors
  get 'statistics', to: 'sensors#statistics'
end
