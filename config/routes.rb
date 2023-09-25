Rails.application.routes.draw do
  get 'cart/index'
  devise_for :users

  root "ecommerce#index"

  get "/home", to: "ecommerce#index"

  resources :products

  resources :cart
  # get "/products", to: "products#productlist"

  # get "/createproduct", to: "createproduct#productlist"
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"



end
