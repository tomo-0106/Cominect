Rails.application.routes.draw do
  get 'users/show'

  devise_for :users
  root to:  "homes#top"
  post '/' => 'homes#top'
   get "home/about" => "homes#about"

  resources :comics do
  resources :reviews, only: [:create, :destroy]
  resource :favorites, only: [:create, :destroy]
  end
  resources :genres, only: [:new, :show, :create, :destroy]
 resources :users, only: [:show, :edit, :update]
end
