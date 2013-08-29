SesusoEms::Application.routes.draw do
  resources :categories

  resources :order_items

  resources :products

  resources :seats

  resources :ball_tables

  resources :orders

  resources :customers

  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"

  get ':controller/:action'
  get 'order_tickets_workflow/start', to: 'order_tickets_workflow#start'

  devise_for :users
  resources :users
end