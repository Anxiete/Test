Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "card#index"

  resources :card, :clans

  get "/search", to: "card#search", as: "search"
  get "/about", to: "card#about", as: "aboutstore"
  get "/home", to: "card#main", as: "homepage"
end
