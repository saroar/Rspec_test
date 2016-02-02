Rails.application.routes.draw do
  resources :albums do
    end
  devise_for :users
  root to: 'articles#index'
  resources :articles
end
