Rails.application.routes.draw do
  resources :users, only: [:show, :edit]
  root 'post_images#index'
  devise_for :users
  resources :books
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
