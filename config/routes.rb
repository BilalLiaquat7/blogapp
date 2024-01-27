Rails.application.routes.draw do
  devise_for :users, :controllers => { :confirmations => 'devise/confirmations' }

  devise_scope :user do
    get '/users/sign_out', to: 'devise/sessions#destroy'
    root to: 'devise/sessions#new'
  end

  resources :users, only: [:index, :show, :new, :create] do
    resources :posts, only: [:index, :show, :new, :create]
  end

  resources :posts, only: [:new, :create] do
    resources :comments, only: [:new, :create]
    resources :likes, only: [:create, :destroy]
  end
end
