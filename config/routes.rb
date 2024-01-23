Rails.application.routes.draw do
<<<<<<< HEAD
  get 'booking/index'
  get 'booking/show'
  get 'booking/new'
  get 'booking/create'
  get 'booking/destroy'
=======
  root to: "pages#home"

>>>>>>> beec2ce7d36f4fabae71c8fe6ed0d6e1a0e5d073
  devise_for :users do
    resources :bookings, only: [:index, :show, :new, :create, :destroy]
    resources :offices, only: [:show, :new, :create, :destroy]
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  resources :offices, only: [:index, :show, :new, :create, :destroy]

end
