Rails.application.routes.draw do
  get '/team', to: 'static#team'
  get '/contact', to: 'static#contact'
  get '/welcome/:first_name', to: 'static#welcome'
  root 'static#index'
  resources :gossips, only: [:index, :new, :create, :show]
  # get '/gossips/:id', to: 'gossips#show'
  get '/gossips/city/:id', to: 'gossips#city'
  get '/author/:id', to: 'gossips#author'
end
