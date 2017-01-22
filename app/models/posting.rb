class Posting < ActiveRecord::Base
  validates_presence_of :user_id, :description, :job_title, :kind, :company_name,
                         :company_location, :application_instructions
  
  belongs_to :user
  has_many :transactions
  
  enum kind: { programming: 0, marketing: 1, design: 2, devops: 3, customer_support: 4}
  
  after_create :queue_job
  
  scope :active, -> { where('expired IS FALSE') }
  scope :with_kind, -> (kinds) { where(kind: kinds[kind]) }
  
  def renew
    self.update_attribute(:expires_at, self.expires_at + 30.days) 
  end
  
  private
  
  def queue_job
    CheckExpiredPostingsJob.set(wait: 30.days).perform_later(self)
  end
end