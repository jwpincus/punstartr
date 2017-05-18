Rails.application.routes.draw do
  root 'home#index'
 
  resources :projects
  namespace :projects do
    resources :rewards, only: [:index, :create]
  end
end
