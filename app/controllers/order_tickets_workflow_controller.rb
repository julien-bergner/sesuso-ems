class OrderTicketsWorkflowController < ApplicationController

  def start
    redirect_to :action => 'select_table'
  end

  def select_table

  end

  def get_ball_tables
    @ball_tables = BallTable.all
    render :json => @ball_tables.to_json
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
    session[:selected_amount_of_seats] = params[:selected_amount_of_seats]
    redirect_to :action => 'select_extras'

  end

  def select_extras
    if session[:selected_table_id].nil?
      redirect_to :action => 'start'
    elsif session[:selected_amount_of_seats].nil?
      redirect_to :action => "select_amount_of_seats"
    else
      @test1 = session[:selected_amount_of_seats]
      @test2 = session[:selected_table_id]
    end

  end

  def receive_selected_extras
    redirect_to :action => "provide_customer_data"
  end

  def provide_customer_data

  end

  def receive_customer_data
    redirect_to :action => "show_summary"

  end

  def show_summary

  end

  def receive_confirmation

  end

  def show_bank_data

  end

end