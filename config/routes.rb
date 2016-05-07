Rails.application.routes.draw do


  resources :users, only: [:new, :create, :show, :edit, :update]
  resources :programs, only: [:index, :show, :create, :new]

end
