class OrderTicketsWorkflowController < ApplicationController

  def start
    redirect_to :action => 'select_table'
  end

  def select_table

  end

  def get_ball_tables
    @ballTables = BallTable.all
    render :json => @ballTables.to_json
  end

  def receive_selected_table
    selected_table_id = params[:selected_table_id]
    redirect_to :action => 'select_amount_of_seats', :selected_table_id => selected_table_id
  end

  def select_amount_of_seats
    @selected_table_id = params[:selected_table_id]
  end

end