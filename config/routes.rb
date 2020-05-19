Rails.application.routes.draw do
  # get 'users/index'
  # get 'users/show'
  # get 'users/create'
  # get 'homepages/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "homepages#index"

  resources :works
  get "works/:id/upvote", to: "works#upvote", as: "upvote"
  resources :users, only: [:index]
  get "/login", to: "users#login_form", as: "login"
  post "/login", to: "users#login"
  post "/logout", to: "users#logout", as: "logout"
  get "users/current",  to: "users#current", as: "current_user"
end
