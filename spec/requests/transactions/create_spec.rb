require 'rails_helper'

describe "POST /transactions" do  
  let(:user) { create(:user) }
  let(:stripe_helper) { StripeMock.create_test_helper }
  let(:posting) { create(:posting) }
  let(:params) { { stripeToken: stripe_helper.generate_card_token, posting_id: posting.id } }
  before { StripeMock.start }
  after { StripeMock.stop }     
                   
  context "user is logged in" do    
    before { sign_in user }
    
    it 'creates a new transaction' do
      post "/transactions", params: params 
      
      expect(response.status).to eq(302)
    end
  end
end
