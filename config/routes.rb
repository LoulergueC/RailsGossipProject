Rails.application.routes.draw do
  get '/team', to: 'static#team'
  get '/contact', to: 'static#contact'
  get '/welcome/:first_name', to: 'static#welcome'
  root 'static#index'
  resources :gossips, only: [:index, :new, :create, :show]
  resources :users, only: [:index, :show]
  resources :cities, only: [:index, :show]
end
