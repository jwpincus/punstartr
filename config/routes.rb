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
  resources :projects, only: [:index, :show, :edit, :new, :create, :update] do
    resources :collaborators, only: [:new, :create]
  end

  namespace :projects do
    get '/:project_id/rewards', to: "rewards#index", as: "rewards"
  end

  get '/checkout/:reward_id', to: "payments#new", as: "checkout"

  resources :sessions, only: [:new, :create, :destroy] do
    post :authorization, on: :collection
  end
  resources :payments, only: [:create]

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :votes, only: [:index, :show, :create, :destroy]
      resource :user, only: [:update]
      namespace :projects do
        get 'most_backers', to: 'most_backers#index'
        get 'ending_soon', to: 'ending_soon#index'
      end
      namespace :categories do
        get 'count_by_project', to: 'count_by_project#index'
      end
    end
  end

  resources :graphs, only: [:index]

end
