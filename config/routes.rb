Rails.application.routes.draw do
  resources :words, only: [:show, :index]
end
