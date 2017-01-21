class Transaction < ActiveRecord::Base
  validates_presence_of :user_id, :posting_id, :transaction_id, :status, :amount
  
  belongs_to :user
  belongs_to :posting
end