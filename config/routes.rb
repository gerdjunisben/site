Rails.application.routes.draw do
  root 'main#index'
  get 'main/index'
  resources :posts, only: [ :index,:show,:new, :create]
end
