Rails.application.routes.draw do

  scope module: :customers do
    devise_for :customers
  end

  delete :carts, to: 'carts#destroy_all'
  resources :carts, only: [:index, :update, :create, :destroy]

  get "search" => "searches#search"

  resources :orders, only: [:index, :new, :show, :create]

  namespace :orders do
    post 'confirm'
    get 'completa'
  end

  resources :items, only: [:index, :show]
  
  resources :addresses, only: [:index, :create, :edit, :update, :destroy]

  resources :customers, only: [:show, :edit, :update] do
    get 'confirm'
    patch 'withdraw'
  end

  devise_for :admins, :controllers => {
    :registrations => 'admins/registrations',
    :sessions => 'admins/sessions'
  }

  devise_scope :admins do
    get "sign_in", :to => "admins/sessions#new"
    get "sign_out", :to => "admins/sessions#destroy"
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :admins do
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :genres, only: [:create, :index, :edit, :update]
    resources :orders, only: [:show, :update]
      get "/", :to => "orders#index", as:"orders"
    resource :order_details, only: [:update]
  end

  root :to => "homes#top"
  get "homes/about" => "homes#about"


end
