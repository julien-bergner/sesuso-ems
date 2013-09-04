SesusoEms::Application.routes.draw do
  resources :categories

  resources :order_items

  resources :products

  resources :orders

  resources :customers

  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"

  get ':controller/:action'
  get 'order_tickets_workflow/start', to: 'order_tickets_workflow#start'
  put 'order_tickets_workflow/receive_selected_amount_of_seats', to: 'order_tickets_workflow#receive_selected_amount_of_seats'
  put 'order_tickets_workflow/receive_selected_extras', to: 'order_tickets_workflow#receive_selected_extras'

  devise_for :users
  resources :users
end