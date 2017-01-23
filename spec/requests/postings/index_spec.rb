require 'rails_helper'

describe "GET /users/user_id:/postings" do  
  let!(:posting) { create(:posting) }
  let!(:posting_2) { create(:posting) }
  let(:params) { { user_id: posting.user_id } }
                   
      
  context "user_id params is passed in" do
    context 'current_user does not mactch params[:user_id]' do
      before { sign_in posting_2.user }
      
      it 'redirects to root_url' do
        get "/users/#{posting.user_id}/postings", params: params
        
        expect(response.body).to redirect_to(root_url)         
      end        
    end    
    
    context 'current_user matches param[:user_id]' do
      before { sign_in posting.user }
      
      it 'shows that users postings' do
        get "/users/#{posting.user_id}/postings", params: params
        
        expect(response.body).to include(posting.job_title)
        expect(response.body).to_not include(posting_2.job_title)                                  
      end
    end
  end
end