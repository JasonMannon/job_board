class CheckExpiredPostingsJob < ApplicationJob
  queue_as :default

  def perform(posting)
    set_expired(posting)
  end
  
  private
  
  def set_expired(posting)
    if posting.expires_at <= Time.now && !posting.expired
      posting.expired = true
    elsif !posting.expired
      CheckExpiredPostingsJob.set(wait: 1.days).perform_later(posting)
    end
  end
end
