Rails.application.routes.draw do
  namespace :api do
    resource :profile, controller: 'users', only: [:create,:show, :update, :destroy]

    resource :session, only: [:create, :destroy]
  end
end
