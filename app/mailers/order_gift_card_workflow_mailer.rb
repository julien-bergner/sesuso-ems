class OrderGiftCardWorkflowMailer < ActionMailer::Base
  default from: "from@example.com"

  def confirmation_mail_for_bank_transfer_payment(order)
    @order = order
    @customer = @order.customer

    @rows = @order.get_summary

    email_with_name = "#{@customer.name} <#{@customer.email}>"
    mail(to: email_with_name, subject: 'Subject')
  end

  def confirmation_mail_for_paypal_payment(order)
    @order = order
    @customer = @order.customer

    @rows = @order.get_summary

    email_with_name = "#{@customer.name} <#{@customer.email}>"
    mail(to: email_with_name, subject: 'Subject')
  end

  def confirmation_mail_to_archive(order)
    @order = order
    @customer = @order.customer

    @rows = @order.get_summary
    @payment_method_string = @order.payment_method == "bank_transfer" ? "Banküberweisung" : "Paypal"
    @gift_card_number_string = @order.order_items.first.gift_card_number.number

    mail(from: "Dance-Discounter <dance-discounter@sesuso.de>",
         to: "dance-discounter@sesuso.de",
         bcc: "dance-discounter@sesuso.de",
         subject: 'Neue Gutscheinbestellung')
  end

end
