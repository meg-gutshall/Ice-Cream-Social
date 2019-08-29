Rails.application.routes.draw do

  get '/' => 'sessions#welcome'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  delete '/logout' => 'sessions#destroy'

  get '/auth/:provider/callback' => 'sessions#create'


  resources :reviews
  resources :ice_creams do
    resources :reviews, only: [:new, :index]
  end

  resources :brands, only: [:index]
  resources :users, only: [:index, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
