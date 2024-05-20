Rails.application.routes.draw do
  devise_for :users

  # Defines the root path route ("/")
  root 'events#index'

  resources :organisers do
    resources :events
  end
  resources :events, only: :index
end
