Rails.application.routes.draw do
  root 'home#index'
  resources :rewards, only: [:index, :create]
end
