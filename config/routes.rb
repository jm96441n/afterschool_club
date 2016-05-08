Rails.application.routes.draw do

  root 'welcome#index'

  get '/logout', to: 'users#logout'
  get '/login', to: 'sessions#new'
  get '/programs/fund', to: 'programs#fund'
  get '/programs/submitted_programs', to: 'programs#submitted_programs'
  get '/users/students', to: 'users#students'

  resources :users, only: [:new, :create, :show, :edit, :update]
  resources :programs
  resources :programs do
  member do
      post 'donate'
    end
  end
  resources :sessions, only: [:new, :create, :destroy]
  resources :user_programs, only: [:new, :create]
  resources :favorites, only: [:create, :destroy]
  resources :attenders, only: [:create, :destroy]

end
