Rails.application.routes.draw do
  devise_for :users
  root to: 'characters#home'

  resources :characters, only: [:index, :show]
  resources :comics, only: [:index, :show]
  resources :favorites, only: [:create, :index, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
