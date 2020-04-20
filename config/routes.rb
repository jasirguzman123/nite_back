Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users
      resources :sessions
      resources :events
      resources :categories
      resources :event_participations
    end
  end
end
