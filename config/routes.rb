Rails.application.routes.draw do
  root 'pages#index'
  devise_for :users
  resources :pages
  resources :tours
  resources :users
  namespace :admin do
    resources :tours
  end

end
