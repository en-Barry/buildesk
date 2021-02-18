Rails.application.routes.draw do
  root 'top#index'

  get 'login', to: 'users#new'
  post 'login', to: 'users#create'
  delete 'login', to: 'users#destroy'
end
