Rails.application.routes.draw do

  resources :user_sessions
  get 'login' =>  'user_sessions#new', :as => :login

  post 'logout' => 'user_sessions#destroy', as: :logout
  resources :users
  # devise_for :users, controllers: {
  #    sessions: 'users/sessions', registrations: 'users/registrations'
  # }

  get 'auth/login'

  get 'auth/logout'

  root to: "posts#index"

  resources :profiles

  resources :posts do
  	resources :qualifications do 
  	end
  	resources :experiences do
  	end
  	resources :projects do
  	end
  	resources :recommendations do
  	end
  end

  #devise_for :users, :controllers => {sessions: 'sessions', registrations: 'registrations'}
   
end
