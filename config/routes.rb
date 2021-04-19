Rails.application.routes.draw do
  devise_for :admins
  devise_for :customers

  resources :customers do
    get 'confirm'
    patch 'withdrawl'
  end

end
