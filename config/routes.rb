Rails.application.routes.draw do
  devise_for :users 
  root to: 'pages#home'
  get '/settings', to: 'pages#settings'
  post '/settings', to: 'pages#toggle_voice', as: :toggle
  patch '/settings', to: 'pages#message', as: :message
  get '/get_help', to: 'pages#get_help', as: :get_help
  resources :contacts, only: [:edit, :update]
end
