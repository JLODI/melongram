Rails.application.routes.draw do
  devise_for :users, controllers: {
        registrations: 'users/registrations',
        sessions: 'users/sessions'
      }
  get "pages/home"
  get "pages/about"
  get "pages/features"
  get "pages/help"
  get "pages/notifications"
  get "pages/explore"

  # Home page
  root "posts#index"

  resources :users, only: [:show]
  resources :posts do
    resources :comments, module: :posts
  end
  resources :comments do
    resources :comments, module: :comments
  end
  resources :likes, only: [:create, :destroy], shallow: true



  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
