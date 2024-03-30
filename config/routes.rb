Rails.application.routes.draw do

  get "up" => "rails/health#show", as: :rails_health_check # Make sure everything is working.

  root to: "questions#new" # Set landing page to 'new' action of questions controller

  post 'questions/displayConversion' # Handles int conversion submissions

  resources :questions
end
