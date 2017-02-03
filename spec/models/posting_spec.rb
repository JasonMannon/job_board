require 'rails_helper'

RSpec.describe Posting do
  context 'validations' do
    it { is_expected.to validate_presence_of(:user_id) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:job_title) }
    it { is_expected.to validate_presence_of(:kind) }
    it { is_expected.to validate_presence_of(:company_name) }
    it { is_expected.to validate_presence_of(:company_location) }
    it { is_expected.to validate_presence_of(:application_instructions) }
  end
  
  context '#renew' do
    let(:posting) { create(:posting) }
    
    it 'adds 30 days to the expires at attribute' do
      expect{posting.renew}.to change{posting.expires_at}.by(30.days)
    end
  end
  
  context '#new?' do
    context 'posting was created 5 days ago' do
      let(:posting) { create(:posting, created_at: 5.days.ago) }
      
      it 'returns true' do
        expect(posting.new?).to eq(true)
      end
    end
    
    context 'posting was created 6 days ago' do
      let(:posting) { create(:posting, created_at: 6.days.ago) }
      
      it 'returns false' do
        expect(posting.new?).to eq(false)
      end
    end
  end
end