Rails.application.routes.draw do
  devise_for :users
  root to: 'general#index'
  get '/search' => 'general#search'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
