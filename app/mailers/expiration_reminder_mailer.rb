class ExpirationReminderMailer < ApplicationMailer
  def perform(posting)
    @posting = posting

    mail(to: @posting.user.email, subject: "Your posting is about to expire")
  end
end
