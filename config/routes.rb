Rails.application.routes.draw do
  root 'home#index'

  get '/signup',    to: "users#new"
  get '/login',     to: "sessions#new"
  get '/logout',    to: "sessions#destroy"
  get '/confirmation', to: "confirmation#show"

  namespace :users, as: :user, path: 'users' do
    get '/:user_id/projects', to: "projects#index"
  end
  resources :users, only: [:new, :create, :index]

  resources :categories, only: [:index, :show]
  resources :rewards, only: [:index, :create, :new]
  resources :projects, only: [:index, :show, :edit, :new, :create]

  namespace :projects do
    get '/:project_id/rewards', to: "rewards#index", as: "rewards"
  end

  get '/checkout/:reward_id', to: "payments#new", as: "checkout"


  resources :sessions, only: [:new, :create, :destroy]
  resources :payments, only: [:create]

  namespace :api do
    namespace :v1 do
      resources :projects, only: [:index]
      resources :users, only: [:index]
    end
  end
end
