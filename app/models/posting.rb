class Posting < ActiveRecord::Base
  validates_presence_of :user_id, :description, :job_title, :kind, :company_name,
                         :company_location, :application_instructions
  
  belongs_to :user
  
  enum kind: { programming: 0, marketing: 1, design: 2, devops: 3, customer_support: 4}
end