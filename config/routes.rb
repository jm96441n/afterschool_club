Rails.application.routes.draw do

  root 'welcome#index'

  get '/login', to: 'sessions#new'
  resources :users, only: [:new, :create, :show, :edit, :update]
  resources :programs, only: [:index, :show, :create, :new]
  resources :sessions, only: [:new, :create, :destroy]

end
