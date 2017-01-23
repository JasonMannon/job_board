Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  
  resources  :users do
   resources :postings, only: [:index, :edit, :update]
  end
  
  root "home#index"
  
  resources :postings, only: [:create, :show, :new] do
    get '/renew', to: "postings#renew"
  end
  
  resources :transactions, only: [:create]
end
