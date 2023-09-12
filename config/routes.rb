# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/login' => 'devise/sessions#new'
    get '/logout' => 'devise/sessions#destroy'
  end
  authenticated :user do
    root to: 'home#index', as: :authenticated_root
  end
  root to: redirect('/login')
end
