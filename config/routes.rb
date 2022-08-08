Rails.application.routes.draw do
  get 'likes/index'
  # get 'books/index'
  # get 'books/show'
  # get 'books/new'
  # get 'books/edit'
  resources :books

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
  # 会員登録マイページ
  get "signup", to: 'users#new'
  post "signup", to: 'users#create'

  # お気に入り登録
  get 'likes', to: 'likes#index', as: 'likes'
  post 'like/:book_id', to: 'likes#create', as: 'like'
  delete 'like/:book_id', to: 'likes#destroy', as: 'unlike'

end
