require 'rails_helper'

describe "PUT /users/:user_id/postings/:posting_id" do  
  let(:user) { create(:user) }
  let(:posting) { create(:posting, user: user) }
  let(:params) { { job_title: "New Title" } } 
                   
  context "user is logged in" do    
    before { sign_in user }
    
    context 'posting belings to current_user' do
      it 'allows user to update that posting' do
        put "/users/#{user.id}/postings/#{posting.id}", params: { posting: params }

        expect(response.status).to eq(302)
      end
      
      it 'updates new attribute passed in' do
        put "/users/#{user.id}/postings/#{posting.id}", params: { posting: params }

        posting.reload
        expect(posting.job_title).to eq('New Title')
      end
    end
    
    context 'posting does not belong to current_user' do
      let(:posting_2) { create(:posting) }
      
      it 'allows user to edit that posting' do
        put "/users/#{user.id}/postings/#{posting_2.id}", params: { posting: params }

        expect(response.status).to redirect_to(root_url)
      end      
    end
  end
  
  context 'user is not logged in' do
    it 'redirects to root_url' do
      put "/users/#{user.id}/postings/#{posting.id}", params: { posting: params }

      expect(response.status).to redirect_to(root_url)      
    end
  end
end