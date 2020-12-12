Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    root "tour_pages#home"
    get "/login", to: "sessions#new"
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"
    namespace :admin do
      resources :bookings, only: [:index, :destroy, :update] do
        member do
          patch :paid
          patch :refund
          patch :cancel
        end
      end
    end
    namespace :user do
      resources :bookings, only: [:show, :create]
    end
  end
end
