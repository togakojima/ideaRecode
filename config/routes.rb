Rails.application.routes.draw do
  devise_for :users
  get 'maps/index'
  root to: "rooms#index"
  resources :users, only: [:edit, :update, :show]
  resources :rooms, only: [:new, :create] do
    resources :ideas, only: [:index, :create]
  end
  resources :maps, only: [:index]
end
