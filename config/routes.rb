Rails.application.routes.draw do

  devise_for :users
  resources :posts do
    resources :comments, only: [:create]
  end

  get '/comments', to: 'comments#index'
  root to: "posts#index"
end
