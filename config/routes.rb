Rails.application.routes.draw do
  get 'cards/show'
  get "dashboard" => 'dashboard#index', as: :dashboard
  # get "accounts/edit" => 'accounts#edit', as: :accounts
  get 'dashboard/products'
  get 'dashboard/orders'
  get 'dashboard/profile'
  resources :products do
    resources :comments
  end

  resources :checkout, only: [:create]
  post "checkout/create", to: "checkout#create"

  devise_for :accounts
  root to: 'public#main'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
