Rails.application.routes.draw do
  devise_for :users 
  root to: 'pages#home'
  get '/settings', to: 'pages#settings'
  post '/settings', to: 'pages#toggle_voice', as: :toggle
  patch '/settings', to: 'pages#message', as: :message
  get '/get_help', to: 'pages#get_help', as: :get_help
  post '/get_help', to: 'pages#send_message', as: :send
  get '/dashboard', to: 'pages#dashboard'
  resources :contacts, only: [:edit, :update]
  # Error pages routes
  get '/404', to: "errors#not_found"
  get '/422', to: "errors#unacceptable"
  get '/500', to: "errors#internal_error"
end
