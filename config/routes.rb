Rails.application.routes.draw do
  root 'home#index'
  
  get '/signup',    to: "users#new"
  get '/login',     to: "sessions#new"

  resources :users, only: [:new, :create, :index ]

  resources :categories, only: [:index]

  resources :rewards, only: [:index, :create]

  resources :projects, only: [:index, :show]
end
