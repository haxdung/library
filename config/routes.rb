Rails.application.routes.draw do
  root "static_pages#home"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  resources :books
  resources :categories
  resources :users
  resources :likes, only: [:destroy, :create]
  resources :rates, only: [:update, :create]
  namespace :admin do
    resources :users, only: [:new, :index, :edit]
    resources :books
    resources :categories
    get "home", to: "admin_pages#home"
  end
end
