Rails.application.routes.draw do

  root 'welcome#index'

  get '/login', to: 'sessions#new'
  get '/programs/submitted_programs', to: 'programs#submitted_programs'
  get '/users/students', to: 'users#students'
  resources :users, only: [:new, :create, :show, :edit, :update]
  resources :programs
  resources :sessions, only: [:new, :create, :destroy]

end
