Rails.application.routes.draw do
  get 'messages/index'
  get 'messages/create'
  
  resources :comments
  resources :activities
  resources :likes, only: [:create, :destroy]
  get '/myactive', to: 'activities#myactive'
  get '/top', to: 'activities#top'
  get '/konkurs', to: 'competitions#index'
  devise_for :users, controllers: { registrations: 'users/registrations' }

  # Notifications routes
  resources :notifications, only: [:index, :create] do
    collection do
      get :unread_count
      patch :mark_all_read
    end
    member do
      patch :mark_read
    end
  end

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
    resources :notifications, only: [:index, :create, :destroy] do
      collection do
        delete :bulk_destroy
      end
    end
  end

  get "/service-worker.js" => "service_worker#service_worker"
  get "/manifest.json" => "service_worker#manifest"
  root 'activities#index'

  resources :rooms, only: [:index, :show] do
    resources :room_messages, only: [:create]
  end

  resources :conversations, only: [:create]
end
