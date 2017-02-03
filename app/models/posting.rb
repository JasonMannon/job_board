class Posting < ActiveRecord::Base
  POSTING_FEE = 150
  RENEWAL_FEE = 50
  
  validates_presence_of :user_id, :description, :job_title, :kind, :company_name,
                         :company_location, :application_instructions
  
  belongs_to :user
  has_many :transactions
  
  enum kind: { programming: 0, marketing: 1, design: 2, devops: 3, customer_support: 4}
  
  after_create :queue_exipration_job
  after_create :queue_reminder_job
  
  scope :active, -> { where(expired: false) }
  
  def renew
    self.update_attribute(:expires_at, self.expires_at + 30.days) 
  end
  
  def new?
    self.created_at >= 5.days.ago.beginning_of_day
  end
  
  private
  
  def queue_exipration_job
    CheckExpiredPostingsJob.set(wait: 30.days).perform_later(self)
  end
  
  def queue_reminder_job
    ExpirationReminderJob.set(wait: 25.days).perform_later(self)
  end
end