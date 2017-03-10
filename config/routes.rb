Rails.application.routes.draw do
  root to: 'pages#home'
  resources :restaurants do
    get '/delete' to:
    resources :reviews, only: [ :index, :new, :create ]
  end
  resources :reviews, only: [ :show, :edit, :update, :destroy ]
end
