Rails.application.routes.draw do
  root to: 'users#index'
  get    '/signup',  to: 'users#new'
  get     '/login',  to: 'sessions#new'
  post    '/login',  to: 'sessions#create'
  delete  '/logout',  to: 'sessions#destroy'

  resources :users do
    resources :items
  end
end
