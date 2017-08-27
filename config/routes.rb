Rails.application.routes.draw do
  namespace :api do
    resource :profile, only: [:create,:show, :update, :destroy]

    resources :users, only: [:show, :index]

    resource :session, only: [:create, :destroy]
  end
end
