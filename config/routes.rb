# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admins, controllers: { sessions: 'admins/sessions' }
  resources :channels

  resources :articles do
    resources :replies
  end

  devise_for :users

  root to: 'home#index'

  get '/:page' => 'static#show'
end
