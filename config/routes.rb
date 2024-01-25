Rails.application.routes.draw do

  root "users#index"
  resources :users, only: [:index, :show, :new, :create] do
    resources :posts, only: [:index, :show, :new, :create]
  end

  resources :posts, only: [:new, :create] do
    resources :comments, only: [:new, :create]
    resources :likes, only: [:create, :destroy]
  end
end
