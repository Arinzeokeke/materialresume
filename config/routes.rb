Rails.application.routes.draw do

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

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "profiles#index" 
end
