Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  get 'users/show'
  root to: "users#show"
  get 'users/new'
  get 'users/create'
  get "signup", to: 'users#new'
  post "signup", to: 'users#create'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
