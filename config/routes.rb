Rails.application.routes.draw do
  devise_for :users
  resources :pages
  resources :tours
end
