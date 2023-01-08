Rails.application.routes.draw do
  devise_for :users, path: :users, path_names: { sign_in: :login, sign_out: :logout, sign_up: :signup }

  root 'products#index'

  resources :products, only: :index do
    member do
      post :buy
    end
  end

  resources :companies

  namespace :seller do
    resources :products
  end
end
