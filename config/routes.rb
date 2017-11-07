Rails.application.routes.draw do
  
  root 'pages#index'
  post 'search', to: 'pages#index'
  resources :articles do
    resources :comments
  end
  resources :users, only: [:new, :create]
  get '/painel', to: 'users#painel'
  get '/layouts/:partial', to: 'pages#partial'
  
  resources :user_sessions, only: [:create, :destroy]
  resources :banners,       only: [:new, :create]
  
  delete '/sign_out', to: 'user_sessions#destroy', as: :sign_out
  get '/sign_in', to: 'user_sessions#new', as: :sign_in
  
  
  
   # global options responder -> makes sure OPTION request for CORS endpoints work
  match '*path', via: [:options], to: lambda {|_| [204, { 'Content-Type' => 'text/plain' }]}
end
