Rails.application.routes.draw do
  get 'pages/index'

  get 'welcome/index'
  root 'pages#index'
  post 'search', to: 'pages#index'
  resources :articles do
    resources :comments
  end
  resources :users, only: [:new, :create]

  resources :user_sessions, only: [:create, :destroy]
  
  delete '/sign_out', to: 'user_sessions#destroy', as: :sign_out
  get '/sign_in', to: 'user_sessions#new', as: :sign_in
end
