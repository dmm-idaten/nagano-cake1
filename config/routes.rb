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
  resources :genres, only: [:create, :index, :edit, :update]
  
end
