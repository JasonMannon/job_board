Rails.application.routes.draw do
  devise_for :users
  
  root "home#index"
  
  resources :postings, only: [:create, :show, :new] do
    get '/renew', to: "postings#renew"
  end
  
  resources :transactions, only: [:create]
end
