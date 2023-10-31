Rails.application.routes.draw do
  get '/team', to: 'static#team'
  get '/contact', to: 'static#contact'
  get '/welcome/:first_name', to: 'static#welcome'
  root 'static#index'
  resources :gossips do
    resources :comments, only: [:new, :create, :destroy, :edit, :update]
  end
  resources :users, only: [:index, :show]
  resources :cities, only: [:index, :show]
end
