Rails.application.routes.draw do

  devise_for :customers

  resources :customers do
    get 'confirm'
    patch 'withdrawl'
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

  namespace :admin do
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    
  end

  resources :genres, only: [:create, :index, :edit, :update]

  root :to => "homes#top"
  get "homes/about" => "homes#about"
end
