Rails.application.routes.draw do

  resources :properties
  resources :locations, only: [:index, :show] do 
    resources :properties, only: [:new]
  end 

  devise_for :users, :controllers => {registrations: 'registrations', omniauth_callbacks: 'callbacks'}
  devise_scope :user do 
    get '/login', to: 'devise/sessions#new', as: 'login'
    get '/signup', to: 'devise/registrations#new', as: 'signup'
    get '/logout', to: 'devise/sessions#destroy', as: 'logout'
  end 
  
  root to: "application#welcome"
end
