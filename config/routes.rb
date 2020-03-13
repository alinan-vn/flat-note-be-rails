Rails.application.routes.draw do

  resources :users, only: [:index, :show, :new, :create]
  resources :notes

  post '/auth', to: 'auth#create'

  get '/user_notes/:user_id', to: 'notes#user_notes'

  # , only: [:index, :show, :new, :create, :edit, :destroy]

end


