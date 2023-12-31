# frozen_string_literal: true

Rails.application.routes.draw do
  resources :posts do
    member { post :like }
    resources :comments
  end

  get 'friends/show'

  devise_for :users, controllers: {
    registrations: 'registrations',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  devise_scope :user do
    get '/login' => 'devise/sessions#new'
    get '/register' => 'devise/registrations#new'
    get '/logout' => 'devise/sessions#destroy'
  end

  authenticated :user do
    root to: 'home#index', as: :authenticated_root
  end

  root to: redirect('/login')

  get '/terms_and_conditions', to: 'terms#show'
  get 'profile/:id', to: 'profile#show', as: 'profile'
  get 'friends', to: 'friends#show', as: 'friends'

  post '/profile/:id/follow', to: 'profile#follow', as: 'follow'
  post '/profile/:id/unfollow', to: 'profile#unfollow', as: 'unfollow'
  post '/profile/:id/unrequest', to: 'profile#unrequest', as: 'unrequest'
  post '/profile/:id/accept', to: 'profile#accept', as: 'accept'
  post '/profile/:id/decline', to: 'profile#decline', as: 'decline'
end
