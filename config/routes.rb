Rails.application.routes.draw do
  devise_for :users
  
  root "home#index"
  
  resources :postings, only: [:create, :show]
end
