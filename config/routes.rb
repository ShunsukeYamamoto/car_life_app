Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root "users#index"
  devise_for :users
  resources :users,only: :index do
    resources :cars,only: :create
  end
  resources :events,only: [:index,:destroy] do
    resources :messages,only: [:index,:show,:create]
  end
end
