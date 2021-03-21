Rails.application.routes.draw do

  devise_for :users
  root to: 'homes#top'
  resources :post_images, except: [:new, :update]
  resources :users, only: [:index, :show, :edit, :update]
  resources :sauna_facilities do
  resources :reviews, only: [:new, :index, :create, :destroy]
  end

end
