require 'rails_helper'

describe PostingsController do
  context 'authorizations' do
    let(:user) { create(:user) }
    let(:attrs) { {user_id: user.id, description: "some description", job_title: "Web Developer", kind: Posting.kinds.keys.first,
                   company_name: "Microsoft", company_location: "Seattle, Wa", application_instructions: "test"}} 
                      
    context 'user is signed in' do      
      before { sign_in user }
      
      context 'all params are valid' do
        it 'can create a posting' do
          post :create, params: { posting: attrs }
          
          expect(response).to redirect_to(posting_path(Posting.last.id)) 
        end        
      end
      
      context 'params are not valid' do
        let(:attrs) { {user_id: user.id, description: "some description", job_title: "Web Developer", kind: Posting.kinds.keys.first,
                       company_name: "Microsoft", company_location: "Seattle, Wa"}}         
        it 'renders view with error message' do
          post :create, params: { posting: attrs }

          expect(response).to render_template(:new)           
        end
      end
    end
  end
end  