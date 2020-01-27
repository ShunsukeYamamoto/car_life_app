Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root "users#index"
  devise_for :users
  resources :user,only: :index
end
