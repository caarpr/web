Rails.application.routes.draw do

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :attendees
  resources :table_events do
    member do
      post :send_contact_details, as: :send_contact_details
    end
  end
  resources :table_locations
  resources :volunteers

  
  root to: "welcome#index"
end
