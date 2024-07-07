Rails.application.routes.draw do
  devise_for :users
  root to: "rooms#index"
  resources :users, only: [:edit, :update, :show]
  resources :rooms, only: [:new, :create] do
    resources :ideas, only: [:index, :create, :destroy]
  end
  resources :maps, only: [:index, :new, :create]
  resources :calendars
end
