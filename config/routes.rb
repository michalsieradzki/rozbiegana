Rails.application.routes.draw do
  get 'messages/index'
  get 'messages/create'
  
  resources :comments
  resources :activities
  resources :likes, only: [:create, :destroy]
  resources :messages, only: [:index, :create]
  get '/myactive', to: 'activities#myactive'
  get '/top', to: 'activities#top'
  get '/konkurs', to: 'competitions#index'
  devise_for :users, controllers: { registrations: 'users/registrations' }

  # Panel administratora
  namespace :admin do
    get 'activities/index'
    get 'activities/show'
    get 'activities/destroy'
    get 'users/index'
    get 'users/show'
    get 'users/edit'
    get 'users/update'
    get 'users/destroy'
    get 'competitions/index'
    get 'competitions/show'
    get 'competitions/new'
    get 'competitions/create'
    get 'competitions/edit'
    get 'competitions/update'
    get 'competitions/destroy'
    get 'dashboard/index'
    root 'dashboard#index'
    
    resources :competitions do
      member do
        patch :activate
        patch :deactivate
        get :statistics
      end
    end
    
    resources :users do
      member do
        patch :toggle_admin
        patch :assign_team
        patch :restore
      end
    end
    
    resources :activities, only: [:index, :show, :destroy] do
      member do
        patch :hide
        patch :unhide
      end
    end
    
    resources :settings, only: [:index, :update]
  end

  get "/service-worker.js" => "service_worker#service_worker"
  get "/manifest.json" => "service_worker#manifest"
  root 'activities#index'
end
