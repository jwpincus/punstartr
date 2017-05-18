Rails.application.routes.draw do
  root 'home#index'
  resources :users, only: [:new, :create, :index ]
  get '/signup', to: "users#new"
  get '/login', to: "sessions#new"
end
