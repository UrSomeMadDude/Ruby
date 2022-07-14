Rails.application.routes.draw do

  devise_for :users
  resources :posts do
    resources :comments, only: [:create]
  end
  resources :likes, only: [:create, :destroy]

  get '/comments', to: 'comments#index'
  root to: "posts#index"
end
