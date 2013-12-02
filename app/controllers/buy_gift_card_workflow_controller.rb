class BuyGiftCardWorkflowController < ApplicationController

  def instructions

  end

  def enter_gift_card_number

  end

  def receive_gift_card_number
    product = Product.find_by_number(params[:gift_card][:number])
    if product.nil?
      flash[:error] = 'Entschuldigung. Ihre Gutscheinnummer wurde nicht gefunden. <br>Bitte kontrollieren Sie Ihre Eingabe oder wenden Sie sich an dance-discounter@sesuso.de!'.html_safe
      redirect_to :action => "enter_gift_card_number"
    else
      redirect_to :action => "enter_gift_card_amount", :product_id => product.id
    end

  end

  def enter_gift_card_amount

  end

  def receive_amount
    redirect_to :action => "select_payment_method"
  end

  def select_payment_method

  end

  def show_bank_data

  end

end
