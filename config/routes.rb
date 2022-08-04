Rails.application.routes.draw do
  get 'sessions/new'
  # HTTPメソッド 名前, to: アクション名
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'


  # get 'users/show'
  root to: "users#show"
  # get 'users/new'
  # get 'users/create'
  # resources "users"
  get "signup", to: 'users#new'
  post "signup", to: 'users#create'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
