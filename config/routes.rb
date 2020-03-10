Rails.application.routes.draw do

  resources :users, only: [:index, :show, :new, :create]
  resources :notes
  post '/auth', to: 'auth#create'
  # , only: [:index, :show, :new, :create, :edit, :destroy]

end
