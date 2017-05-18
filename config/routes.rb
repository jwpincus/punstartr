Rails.application.routes.draw do
  root 'home#index'
  
  get '/signup',    to: "users#new"
  get '/login',     to: "sessions#new"

  resources :users, only: [:new, :create, :index ]
end
