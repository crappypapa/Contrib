Rails.application.routes.draw do
  root 'users#index'
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :users
  resources :groups
  resources :contribution
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
