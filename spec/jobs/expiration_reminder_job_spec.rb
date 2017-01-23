require 'rails_helper'

RSpec.describe ExpirationReminderJob, type: :job do
  let(:posting) { create(:posting) }
  
  it 'sends a reminder email' do
    expect{ ExpirationReminderJob.new.perform posting }.to change{ActionMailer::Base.deliveries.count}.to(1)
  end
end