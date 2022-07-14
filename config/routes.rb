Rails.application.routes.draw do

  devise_for :users
  resources :posts do
    resources :comments, only: [:create]
  end
  resources :likes, only: [:create, :destroy]
  resources :users do
    resources :relationships, only: [:create]
  end
  resources :relationships, only: [:destroy]


  get '/comments', to: 'comments#index'
  get '/users', to: 'users#index'
  root to: "posts#index"
end
