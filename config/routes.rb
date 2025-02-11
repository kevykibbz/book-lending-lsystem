# Rails.application.routes.draw do
  # get "passwords/new"
  # get "passwords/create"
  # get "passwords/edit"
  # get "passwords/update"
  # get "sessions/new"
  # get "sessions/create"
  # get "sessions/destroy"
#   get "users/new"
#   get "users/create"
#   get "users/show"
#   get "borrowings/create"
#   get "borrowings/destroy"
#   get "books/index"
#   get "books/show"
#   # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

#   # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
#   # Can be used by load balancers and uptime monitors to verify that the app is live.
#   get "up" => "rails/health#show", as: :rails_health_check

#   # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
#   # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
#   # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

#   # Defines the root path route ("/")
#   # root "posts#index"
  
# end

Rails.application.routes.draw do
  resources :books, only: [:index, :show]
  resources :borrowings, only: [:create, :destroy]
  resource :user, only: [:new, :create, :show]
  resource :session, only: [:new, :create, :destroy]
  resource :password, only: [:new, :create, :edit, :update]
  root "books#index"
end
