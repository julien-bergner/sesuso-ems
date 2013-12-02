SesusoEms::Application.routes.draw do
  #resources :categories
  #resources :order_items
  #resources :products
  #resources :orders
  #resources :customers

  authenticated :user do
    root :to => 'home#index'
  end
  root :to => 'buy_gift_card_workflow#instructions'

  get ':controller/:action'

  # Order Ticket Workflow
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
  get 'order_tickets_workflow/receive_confirmation', to: 'order_tickets_workflow#receive_confirmation'
  get 'order_tickets_workflow/show_bank_data', to: 'order_tickets_workflow#show_bank_data'

  # Buy gift card workflow
  post 'buy_gift_card_workflow/receive_gift_card_number', to: 'buy_gift_card_workflow#receive_gift_card_number'
  post 'buy_gift_card_workflow/receive_amount', to: 'buy_gift_card_workflow#receive_amount'

  # Back end
  get 'back_end/overview', to: 'back_end#overview'

  match 'back_end/overview' => 'back_end#overview', :as => :overview

  # Orders
  get 'orders/send_confirmation_mail', to: 'orders#send_confirmation_mail'




  devise_for :users, :path => '', :path_names => {:sign_in => 'login', :sign_out => 'logout'}

  resources :users
end