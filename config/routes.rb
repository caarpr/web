Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :attendees
  resources :table_events
  resources :table_locations
  resources :volunteers

  
  root to: "welcome#index"
end
