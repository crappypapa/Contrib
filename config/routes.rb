
Rails.application.routes.draw do

  root 'landing#index'
  resources :users, only: %i[create new]
  resources :contributions, only: %I[index new create]
  resources :groups, only: %I[index new create show]
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
  get 'ungrouped', to: 'contributions#ungrouped'
end
