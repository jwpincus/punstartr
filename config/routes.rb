Rails.application.routes.draw do
  root 'home#index'

  resources :categories, only: [:index]

  resources :rewards, only: [:index, :create]

  resources :projects, only: [:index, :show]
end
