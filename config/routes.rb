Rails.application.routes.draw do
  namespace :api do
    resource :profile, controller: 'users', only: [:create,:show, :update, :destroy]
  end
end
