Rails.application.routes.draw do
  devise_for :users
  root 'main#index'
  get 'main/index'
  get 'about', to: 'main#about'
  get '/auth/:provider/callback' => 'sessions#auth'
  resources :posts, only: [ :index,:show,:new, :create]
end
