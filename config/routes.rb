Rails.application.routes.draw do
  namespace :admin do
      resources :activities
      resources :comments
      resources :likes
      resources :notifications
      resources :teams
      resources :users

      root to: "activities#index"
    end
  resources :comments
  resources :activities
  resources :likes, only: [:create, :destroy]
  get '/myactive', to: 'activities#myactive'
  get '/top', to: 'activities#top'
  get '/konkurs', to: 'competitions#index'
  devise_for :users, controllers: { registrations: 'users/registrations' } 
  
  get "/service-worker.js" => "service_worker#service_worker"
  get "/manifest.json" => "service_worker#manifest"
  root 'activities#index'
end
