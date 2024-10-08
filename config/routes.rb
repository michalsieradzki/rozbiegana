Rails.application.routes.draw do
  get 'messages/index'
  get 'messages/create'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :comments
  resources :activities
  resources :likes, only: [:create, :destroy]
  resources :messages, only: [:index, :create]
  get '/myactive', to: 'activities#myactive'
  get '/top', to: 'activities#top'
  get '/konkurs', to: 'competitions#index'
  devise_for :users, controllers: { registrations: 'users/registrations' }

  get "/service-worker.js" => "service_worker#service_worker"
  get "/manifest.json" => "service_worker#manifest"
  root 'activities#index'
end
