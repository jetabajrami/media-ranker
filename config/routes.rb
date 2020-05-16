Rails.application.routes.draw do
  # get 'users/index'
  # get 'users/show'
  # get 'users/create'
  # get 'homepages/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "homepages#index"

  resources :works
  resources :users do
    resources :works, only: [:create]
  end
end
