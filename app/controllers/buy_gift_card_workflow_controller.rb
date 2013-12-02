class BuyGiftCardWorkflowController < ApplicationController

  def instructions

  end

  def enter_gift_card_number

  end

  def receive_gift_card_number
    redirect_to :action => "enter_amount"

  end

  def enter_amount

  end

  def receive_amount
    redirect_to :action => "select_payment_method"
  end

  def select_payment_method

  end

end
