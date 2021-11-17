Rails.application.routes.draw do
  authenticated :user do
    root to: 'categories#index', as: :authenticated_root
  end
  root to: redirect('categories#index')
  devise_for :users

  resources :categories
  get 'welcome', to: 'splash#index'
end
