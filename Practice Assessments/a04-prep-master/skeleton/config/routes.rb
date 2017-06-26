Links::Application.routes.draw do

  resources :users, only: [:new, :create, :destroy]

  resources :links

  resources :comments

  resource :session, only: [:new, :create, :destroy]

  root to: 'links#index'
end
