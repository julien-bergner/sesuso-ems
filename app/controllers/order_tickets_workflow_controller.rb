class OrderTicketsWorkflowController < ApplicationController

  def start
    redirect_to :action => 'select_seats'
  end

  def select_seats

  end

end