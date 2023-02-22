Rails.application.routes.draw do
  resources :posts
  devise_for :users
  get "users", to: "users#index"
  get "users/show"
  # Defines the root path route ("/")
  root "home#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "home/index"
  get "make_request", to: "home#make_request"
  get "strain/:id", to: "home#strain_show", as: "strain"
end
