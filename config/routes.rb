Rails.application.routes.draw do
  root 'home#index'
  resources :users, only: [:new, :create ]
  get '/signup', to: "users#new"
  get '/login', to: "sessions#new"
end
