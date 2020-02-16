Rails.application.routes.draw do

  resources :users
  # , only: [:index, :show, :new, :create]
  resources :notes
  # , only: [:index, :show, :new, :create, :edit, :update, :destroy]

end
