Rails.application.routes.draw do
  devise_for :users, defaults: { format: :json }

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  namespace :api do
    namespace :v1 do
      resources :test, only: :index
      resources :bookings
      resources :flights, only: %i[index show]
    end
  end
end
