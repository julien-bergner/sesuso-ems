class OrderTicketsWorkflowController < ApplicationController

  def start
    redirect_to :action => 'select_table'
  end

  def select_table

  end

end