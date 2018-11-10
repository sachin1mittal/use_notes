Rails.application.routes.draw do
  get 'login' => 'sessions#new'
  get 'auth' => 'sessions#auth'
  get 'dropbox/auth_callback' => 'sessions#create'

  resources :notes
  root 'notes#index'
end
