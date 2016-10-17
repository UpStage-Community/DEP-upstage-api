Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "productions#index"

  resources :productions, only: [:index, :show]
  resource :companies, only: [:index, :show]
end
