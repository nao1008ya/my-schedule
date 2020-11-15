Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  root to: 'events#index'
  resources :events
  resources :users, only: [:edit, :update]
  resources :groups
end
