Rails.application.routes.draw do
  authenticated :user do
    root to: 'categories#index', as: :authenticated_root
  end
  root to: 'splash#index'

  devise_for :users

  resources :categories
  resources :deals
end
