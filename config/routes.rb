Rails.application.routes.draw do
  root 'events#index'
  resources :users, only: [:new, :create, :show]
  resources :events, only: [:index, :new, :create, :show]
  resources :sessions, only: [:new, :create, :destroy]
  get 'sign_in' => 'sessions#new'
  get 'sign_up' => 'users#new'
  delete 'sign_out' => 'sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
