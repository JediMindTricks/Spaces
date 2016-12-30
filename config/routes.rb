Rails.application.routes.draw do
 root 'home#show'
 resources :posts, only: [:new, :create]
end
