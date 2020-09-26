Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items do
    resources :orders
    member do
      get 'orders'
    end
  end
end