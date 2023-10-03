# frozen_string_literal: true

Rails.application.routes.draw do
  get 'friends/show'
  devise_for :users, controllers: { registrations: 'registrations' }

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
  post '/profile/:id/unfollow', to: 'profile#unollow', as: 'unfollow'
  post '/profile/:id/unrequest', to: 'profile#unrequest', as: 'unrequest'
end
