Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
resources :taos do
resources :comments, only: [:create]
end
root 'taos#index'
end

