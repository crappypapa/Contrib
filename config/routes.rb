
Rails.application.routes.draw do

  root 'landing#index'
  resources :users, only: [:create]
  resources :contributions, only: %I[index new create]
  resources :groups, only: %I[index new create show]
  
  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
  get 'ungrouped', to: 'contributions#ungrouped'
end
