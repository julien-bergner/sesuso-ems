SesusoEms::Application.routes.draw do
  resources :ball_tables

  resources :orders

  resources :customers

  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users
end