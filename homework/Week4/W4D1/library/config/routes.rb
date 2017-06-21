Rails.application.routes.draw do

get 'silly', to: 'silly#fun'

  resources :books
  # , only: [:index, :destroy, :create, :new]


end
