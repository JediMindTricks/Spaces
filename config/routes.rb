Rails.application.routes.draw do
 devise_for :users
 root 'home#show'
 # Added routes using resources
 resources :posts, only: [:new, :create]
end
