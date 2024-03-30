Rails.application.routes.draw do

  get "up" => "rails/health#show", as: :rails_health_check # Make sure everything is working.

  get "/about", to: "about#index" # About page (to play around with).

  root to: "questions#new" # Set landing page to 'new' action of questions controller

  post 'questions/convert' # Handles int conversion submissions

  resources :questions
end
