Rails.application.routes.draw do
  root 'home#index'

  get '/signup',    to: "users#new"
  get '/login',     to: "sessions#new"
  get '/logout',    to: "sessions#destroy"

  resources :users, only: [:new, :create, :index] do
    resources :projects, only: [:index]
  end

  resources :categories, only: [:index]

  resources :rewards, only: [:index, :create, :new]

  resources :projects, only: [:index, :show]
end
