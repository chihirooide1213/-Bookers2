Rails.application.routes.draw do
  # get 'book_comments/create'
  # get 'book_comments/destroy'
  # get 'post_comments/create'
  # get 'post_comments/destroy'

  devise_for :users

  resources :users do
  	resource :relationships, only: [:create, :destroy]
    get :follows, on: :member
    get :followers, on: :member
  end

  root 'homes#top'
  get '/home/about', to: 'homes#about'
  get "search" => "search#search"
  resources :books	do
  	resources :book_comments, only:[:create, :destroy]
   resource :favorites, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

# books/:id/book_comments