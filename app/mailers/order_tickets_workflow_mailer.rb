class OrderTicketsWorkflowMailer < ActionMailer::Base
  default from: "from@example.com"

  def welcome_email(user)
    @user = user
    email_with_name = "#{@user.name} <#{@user.email}>"
    mail(to: email_with_name, subject: 'Welcome to My Awesome Site')
  end

end
