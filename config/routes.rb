Rails.application.routes.draw do
  root to: 'municipes#index'
  devise_for :users
  resources :municipes, except: :destroy
end
