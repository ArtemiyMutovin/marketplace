Rails.application.routes.draw do
  devise_for :users

  root 'products#index'

  resources :products, only: :index do
    member do
      post :buy
    end
  end

  namespace :seller do
    resources :products
  end
end
