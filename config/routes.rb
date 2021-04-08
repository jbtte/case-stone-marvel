Rails.application.routes.draw do
  devise_for :users
  root to: 'general#index'
  get '/search' => 'general#search'
  get "/character/:id" => 'general#show', as: "character"

  get '/search_comic' => 'general#search_comic', as: "search_comic"
  get "/comic/:id" => 'general#comic', as: "comic"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
