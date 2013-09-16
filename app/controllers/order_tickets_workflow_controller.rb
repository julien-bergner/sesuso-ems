class OrderTicketsWorkflowController < ApplicationController

  def start
    redirect_to :action => 'select_table'
  end

  def select_table

  end

  def get_ball_tables
    @ball_tables = BallTable.all
    render :json => @ball_tables.to_json(:methods => :get_number_of_available_seats)
  end

  def receive_selected_table
    selected_table_id = params[:selected_table_id]
    session[:selected_table_id] = selected_table_id
    redirect_to :action => 'select_amount_of_seats'
  end

  def select_amount_of_seats
    selected_table_id = session[:selected_table_id]
    if selected_table_id.nil?
      redirect_to redirect_to :action => 'select_table'
    else
      @selected_table = BallTable.find(selected_table_id)
    end

  end

  def receive_selected_amount_of_seats
    selected_table_id = session[:selected_table_id]
    selected_amount_of_seats = params[:selected_amount_of_seats]

    order = Order.create!()
    product = Product.find_by_ball_table_id(selected_table_id)
    OrderItem.create!(:order_id => order.id, :product_id => product.id, :quantity => selected_amount_of_seats)
    session[:order_id] = order.id

    redirect_to :action => 'select_extras'

  end

  def select_extras

    @food_category = Category.find_by_caption("Food")
    @extras = Product.find_all_by_category_id(@food_category.id)

  end

  def receive_selected_extras

    food_category = Category.find_by_caption("Food")
    extras = Product.find_all_by_category_id(food_category.id)
    extras.each do |extra|

      amount = params["input-amount-" + extra.id.to_s]
      unless amount == 0 then
        OrderItem.create!(:order_id => session[:order_id], :product_id => extra.id, :quantity => amount)
      end


    end

    redirect_to :action => "provide_customer_data"
  end

  def provide_customer_data
    @customer = Customer.new

  end

  def receive_customer_data
    @customer = Customer.new(params[:customer])

    if @customer.save
      order = Order.find(session[:order_id])
      order.customer_id = @customer.id
      order.save

      redirect_to :action => "show_summary"

    else
      render action: "provide_customer_data"

    end

  end

  def show_summary
    @order = Order.find(session[:order_id])
    @customer = Customer.find(@order.customer.id)
    @rows = @order.get_summary

  end

  def receive_confirmation
    @order = Order.find(session[:order_id])
    @order.order_status_id = 1
    @order.save

    @order.send_confirmation_mail

    redirect_to :action => "show_bank_data"

  end


  def show_bank_data
    @order = Order.find(session[:order_id])
    order_item = @order.order_items.select{|i| i.product.is_a?(Seat)}.first
    @ballTable = BallTable.find(order_item.product.ball_table_id)

  end



end