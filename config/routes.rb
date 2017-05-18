Rails.application.routes.draw do
  root 'home#index'
  resources :categories, only: [:index]
end
