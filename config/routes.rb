Rails.application.routes.draw do

  get "/sauna_facilities/:id/map" => "sauna_facilities#map", as: 'map'
  devise_for :users
  root to: 'homes#top'

  resources :post_images do
    resources :post_comments, only: [:create, :destroy]
  end
  resources :users, only: [:index, :show, :edit, :update] do
    member do
      get :following, :followers
    end
  end
  resources :relationships, only: [:create, :destroy]
  resources :sauna_facilities do
   resources :reviews, only: [:new, :index, :create, :destroy]
  end

end
