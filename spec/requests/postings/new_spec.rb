require 'rails_helper'

describe "GET /postings/new" do  
  context "user is logged in" do
    let(:user) { create(:user) }
    
    before { sign_in user }
    
    it 'allows access to view' do
      get '/postings/new' 
      
      expect(response.status).to eq(200)
    end
  end
  
  context 'user is not logged in' do
    it 'redirects user' do
      get '/postings/new'
      
      expect(response.status).to eq(302)
    end
  end
end