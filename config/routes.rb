Rails.application.routes.draw do
  get 'homepages/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :works
end
