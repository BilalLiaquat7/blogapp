Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get '/users', to: 'users#index'
  # resources :users, only: [:index, :show] do
    # resources :post, only: [:index, :new, :create, :show] do
    #   resources :comments, only [:new, :create]
    #   resources :likes, only [:create]
end
