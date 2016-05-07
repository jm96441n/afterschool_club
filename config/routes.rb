Rails.application.routes.draw do

  root 'welcome#index'

  resources :users, only: [:show, :edit, :update]
  resources :programs, only: [:index, :show]
  resources :ideas, only: [:create, :new, :index, :show]

end
