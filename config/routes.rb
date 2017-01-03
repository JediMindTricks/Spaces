Rails.application.routes.draw do
 devise_for :users
 root 'home#show'
 # Added routes using resources
 resources :users, only: [:show, :edit, :update]
 resources :posts, only: [:new, :create]
end
