Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get 'users' => 'users#index'
  # post 'users' => 'users#create'
  # get 'users/new' => 'users#new'
  # get 'users/:id/edit' => 'users#edit'
  # get 'users/:id' => 'users#show'
  # patch 'users/:id' => 'users#update'
  # put 'users/:id' => 'users#update'
  # delete 'users/:id' => 'users#destroy'
  resources :users, :only => [:create, :destroy, :index, :show, :update] do
    resources :artworks, :only => [:index]
  end

  resources :artworks, only: [:create, :update, :index, :show, :destroy]
  resources :artwork_shares, only: [:create, :destroy]

end
