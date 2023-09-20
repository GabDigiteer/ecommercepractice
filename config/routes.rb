Rails.application.routes.draw do
  devise_for :users

  root "ecommerce#index"

  get "/home", to: "ecommerce#index"

  get "/products", to: "ecommerce#products"

  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"


end
