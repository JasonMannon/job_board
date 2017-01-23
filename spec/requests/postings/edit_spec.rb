require 'rails_helper'

describe "GET /users/:user_id/postings/:posting_id/edit" do  
  let(:user) { create(:user) }
  let(:posting) { create(:posting, user: user) }
  let(:params) { { user_id: user.id, posting_id: posting.id } }
                   
  context "user is logged in" do    
    before { sign_in user }
    
    context 'posting belings to current_user' do
      it 'allows user to edit that posting' do
        get "/users/#{user.id}/postings/#{posting.id}/edit", params: { posting: params }

        expect(response.status).to render_template(:edit)
      end      
    end
  end
end