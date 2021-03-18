Rails.application.routes.draw do

  devise_for :users
  root to: 'homes#top'
  resources :post_images, only: [:new, :create, :index, :show, :destroy]
  resources :sauna_facilities, only: [:index, :show]
end
