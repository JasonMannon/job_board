require 'rails_helper'

describe ExpirationReminderMailer do
  
  context '.perform' do
    let(:posting) { create(:posting) }
    
    it 'uses the correct subject text' do
      expect(described_class.perform(posting).subject).to eq('Your posting is about to expire')
    end
    
    it 'uses the correct from email' do
      expect(described_class.perform(posting).from).to eq(["hello@job_board.com"])
    end    
    
    it 'users the correct to email' do
      expect(described_class.perform(posting).to).to eq([posting.user.email])
    end
    
    context 'body' do
      let(:body) { described_class.perform(posting).body.raw_source }

      it 'shows the job title' do
        expect(body).to include("Your posting titled #{posting.job_title} is going to expire in 5 days")
      end
    end  
      
  end
end