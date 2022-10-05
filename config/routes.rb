Rails.application.routes.draw do
  resources :profiles
  resources :order_items
  resources :orders
  resources :products
  resources :users, only: [:create]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
