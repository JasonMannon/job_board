require 'rails_helper'

describe "POST /postings" do  
  let(:user) { create(:user) }
  let(:attrs) { {user_id: user.id, description: "some description", job_title: "Web Developer", kind: Posting.kinds.keys.first,
                 company_name: "Microsoft", company_location: "Seattle, Wa", application_instructions: "test"}}     
                   
  context "user is logged in" do    
    before { sign_in user }
    
    it 'allows user to create a posting' do
      post "/postings", params: { posting: attrs }

      expect(response.status).to eq(302)
    end
    
    context 'params[:commit] == "Preview"' do
      it 'renders new view' do      
        expect(post "/postings", params: { posting: attrs, commit: "Preview" }).to render_template(:new)
      end
    end
    
    context 'required param is missing' do
      let(:attrs) { {user_id: user.id, description: "some description", job_title: "Web Developer", kind: Posting.kinds.keys.first,
                     company_name: "Microsoft", company_location: "Seattle, Wa"}}           
      
      it 'renders new view' do        
        expect(post "/postings", params: { posting: attrs }).to render_template(:new)
      end
    end
  end
end