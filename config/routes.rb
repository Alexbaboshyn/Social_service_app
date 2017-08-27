Rails.application.routes.draw do
  namespace :api do
    resource :profile, only: [:create,:show, :update, :destroy] do
      resource :avatar, only: [:create, :update, :destroy]
    end

    resources :users, only: [:show, :index]

    resource :session, only: [:create, :destroy]
  end
end
