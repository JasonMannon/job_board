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
end