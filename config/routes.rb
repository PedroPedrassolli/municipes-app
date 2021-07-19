Rails.application.routes.draw do
  root to: 'application#index'
  devise_for :users
end
