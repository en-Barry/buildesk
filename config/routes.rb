Rails.application.routes.draw do
  root 'top#index'

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'

  post 'oauth/callback', to: 'oauths#callback'
  get 'oauth/callback', to: 'oauths#callback'
  get 'oauth/:provider', to: 'oauths#oauth', :as => :auth_at_provider

  resources :users, only: %i[new create]
  resources :categories, only: %i[index show], param: :name
  resources :posts
end
