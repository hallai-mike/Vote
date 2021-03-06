Rails.application.routes.draw do
  get 'sessions/new'
  root 'static_pages#home'
  get '/help', to: 'static_pages#help'
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get  '/results',  to: 'static_pages#results'
  post '/vote', to: 'results#create'

  resources :users
  resources :issues do
    resources :options
  end
  resources :results
end
