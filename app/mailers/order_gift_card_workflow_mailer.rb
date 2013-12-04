class OrderGiftCardWorkflowMailer < ActionMailer::Base
  default from: "from@example.com"

  def confirmation_mail_for_bank_transfer_payment(order)
    @order = order
    @customer = @order.customer

    @rows = @order.get_summary

    email_with_name = "#{@customer.name} <#{@customer.email}>"
    mail(to: email_with_name, subject: 'Subject')
  end

  def confirmation_mail_for_bank_transfer_payment
    @order = order
    @customer = @order.customer

    @rows = @order.get_summary

    email_with_name = "#{@customer.name} <#{@customer.email}>"
    mail(to: email_with_name, subject: 'Subject')
  end

end
