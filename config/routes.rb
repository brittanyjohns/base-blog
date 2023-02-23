Rails.application.routes.draw do
  resources :strains
  resources :posts
  devise_for :users
  get "users", to: "users#index"
  get "users/show"
  # Defines the root path route ("/")
  root "home#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "home/index"
  get "seed_data", to: "home#seed_data"
end
