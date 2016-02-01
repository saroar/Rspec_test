Rails.application.routes.draw do
  resources :pictures
  resources :albums
  devise_for :users
  root to: 'articles#index'
  resources :articles
end
