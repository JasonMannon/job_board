require 'rails_helper'

RSpec.describe JobBoard::Stripe::CreateCharge do
  
  context 'creating a charge' do
    let(:stripe_helper) { StripeMock.create_test_helper }
    let(:posting) { create(:posting) }
    let(:params) { { token: stripe_helper.generate_card_token, posting_id: posting.id, amount: 150, email: 'test@gmail.com' } }
    before { StripeMock.start }
    after { StripeMock.stop }  
    
        
    it 'creates a charge' do 
      charge = JobBoard::Stripe::CreateCharge.new(params).execute

      expect(charge.status).to eq('succeeded')
    end        
  end

end