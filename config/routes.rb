Rails.application.routes.draw do
  devise_for :users, defaults: { format: :json }
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      resources :test, only: :index
    end
  end
end
