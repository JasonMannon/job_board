require 'rails_helper'

RSpec.describe CheckExpiredPostingsJob, type: :job do
  context 'listing has expired' do
    let!(:posting) { create(:posting, expires_at: -31.days.from_now, expired: false) }
    
    it 'sets expired attribute to true' do
      expect{ CheckExpiredPostingsJob.new.perform posting }.to change{posting.expired}.to(true)
    end
  end
  
  context 'listing is not expired' do
    let!(:posting) { create(:posting, expired: false) }
    
    it 'does not change the expired attribute' do 
      CheckExpiredPostingsJob.new.perform posting
      
      posting.reload
      expect(posting.expired).to eq(false)
    end
  end
end
