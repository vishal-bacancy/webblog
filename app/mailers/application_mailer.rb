class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'

  def new_comment(user)
    @user = user
    mail(to: @user.email, subject: 'New comment on your Blog')
  end

  def new_reply(user)
    @user = user
    mail(to: @user.email, subject: 'New reply on your comment')
  end
end
