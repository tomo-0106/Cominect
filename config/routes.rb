Rails.application.routes.draw do
  get 'users/show'

  devise_for :users
  root to:  "homes#top"
  post '/' => 'homes#top'
   get "home/about" => "homes#about"
   get "comics/search" => "comics#search"
  resources :comics do
  resources :reviews, only: [:create, :destroy]
  resource :favorites, only: [:create, :destroy]
  end
  resources :genres, only: [:new, :show, :create, :destroy]
 resources :users, only: [:show, :edit, :update]
 
# ゲストログイン
  post '/homes/guest_sign_in', to: 'homes#new_guest'
end
