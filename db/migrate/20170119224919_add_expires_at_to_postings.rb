class AddExpiresAtToPostings < ActiveRecord::Migration[5.0]
  def change
    add_column :postings, :expires_at, :datetime, default: 30.days.from_now
    add_column :postings, :expired, :boolean, default: true
  end
end
