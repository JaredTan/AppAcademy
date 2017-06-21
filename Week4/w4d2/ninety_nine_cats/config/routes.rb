Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :cats, only: [:new, :create, :edit, :update, :destroy, :index, :show]

  resources :cat_rental_requests, only: [:new, :create, :edit, :update, :destroy, :index, :show]

end
