Rails.application.routes.draw do

  resources :welcome, only: [:index]
  resources :users, only: [:new, :edit, :create, :update, :destroy]
  resources :sessions, only: [:new, :create, :destroy]
  resources :statuses, only: [:index]

  root "welcome#index"

  get '/signin', to:'sessions#new'
  delete '/signout', to: 'sessions#destroy'
end
