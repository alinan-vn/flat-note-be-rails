Rails.application.routes.draw do

  resources :users
  # , only: [:index, :show, :new, :create]
  resources :notes

  # delete '/reviews/:id' => 'reviews#destroy' 


  # , only: [:index, :show, :new, :create, :edit, :update, :destroy]

end
