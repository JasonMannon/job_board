class ExpirationReminderJob < ApplicationJob
  queue_as :default

  def perform(posting)
    send_reminder_email(posting)
  end
  
  private
  
  def send_reminder_email(posting)
    ExpirationReminderMailer.perform(posting).deliver
  end
end
