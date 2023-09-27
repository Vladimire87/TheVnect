# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  as :user do
    get 'users/profile', to: 'devise/registrations#edit', as: :user_root
  end

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
end
