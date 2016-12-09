Rails.application.routes.draw do
  get 'recommendations/index'

  get 'recommendations/new'

  get 'recommendations/edit'

  get 'recommendations/delete'

  get 'projects/index'

  get 'projects/new'

  get 'projects/edit'

  get 'projects/delete'

  get 'experiences/index'

  get 'experiences/new'

  get 'experiences/edit'

  get 'experiences/delete'

  get 'qualifications/index'

  get 'qualifications/new'

  get 'qualifications/edit'

  get 'qualifications/delete'

=begin
  get 'posts/index'

  get 'posts/edit'

  get 'posts/show'

  get 'posts/new'
=end

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
