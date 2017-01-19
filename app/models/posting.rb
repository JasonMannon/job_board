class Posting < ActiveRecord::Base
  validates_presence_of :user_id, :description, :title, :kind, :company_name,
                         :company_location, :application_instructions
  
  belongs_to :user
end