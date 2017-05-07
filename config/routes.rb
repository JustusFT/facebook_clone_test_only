Rails.application.routes.draw do

  resources :welcome, only: [:index]
  resources :users, only: [:new, :edit, :create, :update, :destroy]
  resources :statuses, only: [:index]

end
