Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "/settings", to: "pages#settings"
  patch "/settings", to: "users#toggle_voice", as: :toggle
  post "/settings", to: "users#message", as: :message
  resources :contacts, only: [:new, :create, :edit, :update, :destroy]
end
