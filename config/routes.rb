Rails.application.routes.draw do
  
  get 'home/about'
  devise_for :users, :controllers => {
  	:registrations => 'users/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books, only: [:new, :create, :index, :show, :destroy, :edit, :update]

  resources :users, only: [:show, :index, :create, :edit, :update]

  resources :root, only: [:top]
  
  root 'root#top'



end
