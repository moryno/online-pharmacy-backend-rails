Rails.application.routes.draw do
  resources :profiles, only: [:create]
  resources :order_items
  resources :orders
  resources :products
  resources :users, only: [:index, :show, :update, :destroy]
  post "/register", to: "auth#register"
  post "/login", to: "auth#login"
  
end
