Rails.application.routes.draw do
  root 'home#index'

  get '/signup',    to: "users#new"
  get '/login',     to: "sessions#new"
  get '/logout',    to: "sessions#destroy"

  resources :users, only: [:new, :create, :index]

  namespace :users do
    get '/:user_id/projects', to: "projects#index"
  end
  resources :categories, only: [:index, :show]
  resources :rewards, only: [:index, :create, :new]
  resources :projects, only: [:index, :show, :edit]

  namespace :projects do
    get '/:project_id/rewards', to: "rewards#index", as: "rewards"
    # post '/:project_id/rewards', to: "rewards#create"
  end

  get '/checkout/:reward_id', to: "payments#new", as: "checkout"

  resources :sessions, only: [:new, :create, :destroy]
  resources :payments, only: [:create]
end
