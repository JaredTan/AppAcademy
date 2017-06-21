Rails.application.routes.draw do

  get 'users', to: 'users#index'
  get 'users/:id', to: 'users#show', as: 'user'
  get 'users/new', to: 'users#new', as: 'new_user'
  get 'users/:id/edit', to: 'users#edit', as: 'edit_user'
  post 'users', to: 'users#create'
  patch 'users/:id', to: 'users#update'
  put 'users/:id', to: 'users#format'
  delete 'users/:id', to: 'users#delete'
  # resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
