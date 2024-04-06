Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  root to: "home#index"

  resources :questboard, only: [:index] do
  end

  resources :logout, only: [:index] do
  end

  get '/questboard' => "questboard#index", :as => :user_root

  resources :parties do
  end

  resources :party_requests do
  end

  resources :party_members do
  end

  resources :quests do
  end
end
