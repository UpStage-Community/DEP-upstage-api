Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "productions#index"

  resources :productions, only: [:index, :show]
  resources :companies, only: [:index, :show]
end
