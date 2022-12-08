Rails.application.routes.draw do
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "card#index"

  resources :card, :clans, :about, :contact
  resources :cart, only: %i[index show create update destroy]
  resources :orders, only: %i[create]
  resources :quantities, only: %i[create]

  get "/search", to: "card#search", as: "search"
  get "/about", to: "about#index", as: "aboutstore"
  get "/contact_us", to: "contact#index", as: "contactus"
  get "/home", to: "card#main", as: "homepage"
end
