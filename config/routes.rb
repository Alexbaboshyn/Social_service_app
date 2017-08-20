Rails.application.routes.draw do
  namespace :api do
    resource :profile, controller: 'users'
  end
end
