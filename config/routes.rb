Rails.application.routes.draw do
  get 'categories/index'
  get 'categories/edit'
  get '/search' => 'search#search'
  root 'homes#top'
  get 'home/about' => 'homes#about'
  get 'home/search' => "homes#search"
  devise_for :users
  resources :users, only: [:show,:index,:edit,:update] do
    member do
    get :following, :followers
    end
  end
  resources :relationships, only: [:create, :destroy]
  resources :books do
    resources :book_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
    collection do
      get 'search'
    end
  end
end