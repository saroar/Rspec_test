Rails.application.routes.draw do
  resources :albums do
    resources :pictures
  end
  devise_for :users
  root to: 'articles#index'
  resources :articles
end
