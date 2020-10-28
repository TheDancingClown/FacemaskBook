# frozen_string_literal: true

Rails.application.routes.draw do
  get 'users/index'
  devise_for :users, :path_prefix => 'd' ##
  root to: 'posts#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts do
    resources :likes
  end
  resources :users, :only =>[:show] ##
  resources :comments
  match '/users', to: 'users#index', via: 'get'
  match '/users/:id', to: 'users#show', via: 'get'
end
