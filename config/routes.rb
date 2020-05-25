Rails.application.routes.draw do
	devise_for :users

  resources :users, only: [:show,:edit,:update,:index] do
 	  member do
      get :following, :followers
    end
  end

  root 'home#top'
  get 'home/about'

  resources :books, only: [:index, :show, :edit, :create, :update, :destroy] do
    resource :book_comments, only: [:create, :destroy]
    resource :favorites, 		 only: [:create, :destroy]
  end

  resources :relationships, only: [:create, :destroy]
end
