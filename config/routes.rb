Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  

  root 'homes#top'
  get 'search', to:'searches#search'

  resource :profile, only: [:show, :edit, :update]
  resource :account, only: [:show]

  resources :rooms 
  resources :reservations
end
