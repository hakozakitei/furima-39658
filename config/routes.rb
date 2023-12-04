Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'items#index'
  resources :items, only: [:new,:create,:index,:show,:edit,:update,:destroy]
  # Defines the root path route ("/")
  # root "articles#index"
end
