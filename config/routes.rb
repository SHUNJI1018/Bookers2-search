Rails.application.routes.draw do
  
  get 'search' => 'search#search'
  
  devise_for :users
  
  resources :users, only: [:show,:index,:edit,:update] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
  	get 'followers' => 'relationships#followers', as: 'followers'
  end
  
  resources :books, only: [:show,:index,:create,:edit,:update,:destroy] do
    resources :book_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  
  root 'homes#top'
  get 'home/about' => 'homes#about'
  
  
end