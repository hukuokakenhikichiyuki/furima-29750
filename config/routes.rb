Rails.application.routes.draw do
  devise_for :users
  root to: "users#index"
  #resorces :items,
  # resources :users, only: [:index, :new, :update]
end