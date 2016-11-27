Rails.application.routes.draw do
    root to: "productions#index"
    devise_for :users, only: []

    resources :productions, only: [:index, :show]
    resources :companies, only: [:index, :show]
    resources :sessions, only: [:create, :destroy, :show]

    resources :users, only: [:create, :destroy, :show, :update]

end
