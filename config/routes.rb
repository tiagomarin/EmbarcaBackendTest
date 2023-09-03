# frozen_string_literal: true

Rails.application.routes.draw do
  root to: "cities#index"
  resources :cities, only: [:index]
  resources :states, only: [:index]
end
