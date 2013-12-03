class BuyGiftCardWorkflowController < ApplicationController

  def start
    redirect_to :action => 'instructions'
  end

  def instructions

  end

  def enter_gift_card_number

  end

  def receive_gift_card_number
    product = Product.find_by_number(params[:gift_card][:number])
    if product.nil?
      flash[:error] = 'Entschuldigung. Ihre Gutscheinnummer wurde nicht gefunden.<br>Bitte korrigieren Sie Ihre Eingabe oder wenden Sie sich an dance-discounter@sesuso.de!'.html_safe
      redirect_to :action => "enter_gift_card_number"
    elsif product.order_items.count >= product.quantity
      flash[:error] = 'Dieser Gutschein wurde bereits aktiviert.<br>Bitte korrigieren Sie Ihre Eingabe, geben Sie eine andere Gutscheinnummer ein oder wenden Sie sich an dance-discounter@sesuso.de!'.html_safe
      redirect_to :action => "enter_gift_card_number"
    else
      redirect_to :action => "enter_gift_card_amount", :product_id => product.id
    end

  end

  def enter_gift_card_amount
    @product_id = params[:product_id]
  end

  def receive_amount

    product = Product.find(params[:gift_card][:product_id])
    amount = params[:gift_card][:amount]

    if product.nil?
      redirect_to :action => "enter_gift_card_number"
    elsif amount.empty?
      flash[:error] = 'Bitte geben Sie einen Betrag ein.'.html_safe
      redirect_to :action => "enter_gift_card_amount", :product_id => product.id
    elsif not amount =~ /(^[0-9]*[.,][0-9]{2}$)|(^[0-9]*$)/
      flash[:error] = 'Bitte geben Sie einen Betrag in einem Format wie 20 oder 20,50 ein.'.html_safe
      redirect_to :action => "enter_gift_card_amount", :product_id => product.id
    else
      product.price = amount.gsub(',', '.')
      product.save

      order = Order.create!(:overall_amount => product.price)

      OrderItem.create!(:order_id => order.id, :product_id => product.id, :quantity => 1)

      redirect_to :action => "select_payment_method", :order_id => order.id
    end

  end

  def select_payment_method
    @order_id = params[:order_id]
  end

  def receive_payment_method
    order = Order.find(params[:order_id])
    order.payment_method = params[:payment_method]
    order.save

    if order.payment_method = "bank_transfer"
      redirect_to :action => "show_bank_data", :order_id => order.id
    end
  end

  def show_bank_data
    @order = Order.find(params[:order_id])
    # To do send mail

  end

end
