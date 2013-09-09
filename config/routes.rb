SesusoEms::Application.routes.draw do
  #resources :categories
  #resources :order_items
  #resources :products
  #resources :orders
  #resources :customers

  authenticated :user do
    root :to => 'home#index'
  end
  root :to => 'order_tickets_workflow#start'

  #get ':controller/:action'
  get 'order_tickets_workflow/start', to: 'order_tickets_workflow#start'
  get 'order_tickets_workflow/select_table', to: 'order_tickets_workflow#select_table'
  get 'order_tickets_workflow/get_ball_tables', to: 'order_tickets_workflow#get_ball_tables'
  get 'order_tickets_workflow/receive_selected_table', to: 'order_tickets_workflow#receive_selected_table'
  get 'order_tickets_workflow/select_amount_of_seats', to: 'order_tickets_workflow#select_amount_of_seats'
  put 'order_tickets_workflow/receive_selected_amount_of_seats', to: 'order_tickets_workflow#receive_selected_amount_of_seats'
  get 'order_tickets_workflow/select_extras', to: 'order_tickets_workflow#select_extras'
  put 'order_tickets_workflow/receive_selected_extras', to: 'order_tickets_workflow#receive_selected_extras'
  get 'order_tickets_workflow/provide_customer_data', to: 'order_tickets_workflow#provide_customer_data'
  post 'order_tickets_workflow/receive_customer_data', to: 'order_tickets_workflow#receive_customer_data'
  get 'order_tickets_workflow/show_summary', to: 'order_tickets_workflow#show_summary'

  devise_for :users
  resources :users
end