require 'rails_helper'

describe "POST /transactions" do  
  let(:user) { create(:user) }
  let(:stripe_helper) { StripeMock.create_test_helper }
  let(:posting) { create(:posting) }
  let(:params) { { stripeToken: stripe_helper.generate_card_token, posting_id: posting.id, amount: 150 } }
  before { StripeMock.start }
  after { StripeMock.stop } 
  
  before do
    t = Time.local(2017, 9, 1, 10, 5, 0)
    Timecop.travel(t)    
  end    
                   
  context "user is logged in" do    
    before { sign_in user }
    
    it 'creates a new transaction' do
      post "/transactions", params: params 
      
      expect(response.status).to eq(302)
    end
    
    context 'transaction is a renewal' do
      before do
        params[:renewal] = true
        posting.expires_at = Time.now + 30.days
        posting.save
      end
      
      it 'renews the posting' do
        post "/transactions", params: params 
        
        posting.reload
        expect(response.status).to eq(302)              
        expect(posting.expires_at.beginning_of_day).to eq ((Date.today + 60.days).beginning_of_day)
        expect(posting.expired).to eq(false)
      end
    end
  end
end
