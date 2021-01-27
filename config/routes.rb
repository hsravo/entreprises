Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :charities
  resources :charities, only: [:index, :show]
end
