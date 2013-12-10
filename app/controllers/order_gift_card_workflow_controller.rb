class OrderGiftCardWorkflowController < ApplicationController
  layout "order_gift_card_workflow_layout"

  def start
    redirect_to :action => 'instructions'
  end

  def instructions

  end

  def enter_gift_card_number

  end

  def receive_gift_card_number
    number = params[:gift_card][:number]
    if not number =~ /^[0-9]{3}$/
      flash[:error] = 'Bitte geben Sie genau 3 Ziffern ein.<br>Beispiele: 004, 049, 754, ...'.html_safe
      redirect_to :action => "enter_gift_card_number"
    else
      product = Product.find_by_number(Figaro.env.gift_card_number_prefix + number)
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

      redirect_to :action => "provide_customer_data", :order_id => order.id
    end

  end

  def provide_customer_data
    @customer = Customer.new
    order_id = params[:order_id]
    render action: "provide_customer_data", :locals => {:order_id => order_id}

  end

  def receive_customer_data
    order = Order.find(params[:customer].delete("order_id"))
    @customer = Customer.new(params[:customer])

    if @customer.save
      order.customer_id = @customer.id
      order.save

      redirect_to :action => "show_summary", :order_id => order.id

    else
      render action: "provide_customer_data", :locals => {:order_id => order.id}

    end

  end

  def show_summary
    @order = Order.find(params[:order_id])
    @customer = Customer.find(@order.customer.id)
    @rows = @order.get_summary

  end

  def receive_confirmation
    order = Order.find(params[:order_id])
    order.order_status_id = 1
    order.save

    redirect_to :action => "select_payment_method", :order_id => order.id

  end

  def select_payment_method
    @order_id = params[:order_id]
  end

  def receive_payment_method
    order = Order.find(params[:order_id])
    order.payment_method = params[:payment_method]
    order.save

    if order.payment_method == "bank_transfer"
      order.send_confirmation_mail_for_bank_transfer_payment
      redirect_to :action => "show_bank_data", :order_id => order.id
    elsif order.payment_method == "paypal"
      order.send_confirmation_mail_for_paypal_payment
      redirect_to order.paypal_url("www.sesuso.de")
    end
  end

  def show_bank_data
    @order = Order.find(params[:order_id])
    # To do send mail

  end

end
