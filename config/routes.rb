Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root "users#index"
  devise_for :users
  resources :users,only: :index do
    collection do
      get 'search_page'
    end
    member do
      get 'search_page_index'
    end
    resources :cars,only: [:create,:update]
  end
  resources :events,only: [:index,:destroy,:create] do
    resources :messages,only: [:index,:show,:create] do
      collection do
        get 'auto_update_sales'
        get 'auto_update_customer'
      end
    end
  end
end
