Rails.application.routes.draw do


  devise_for :users
  root to: 'homes#top'
  resources :post_images
  resources :sauna_facilities
  resources :users

end
