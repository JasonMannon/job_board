require 'rails_helper'

describe ApplicationHelper do
  context '#new_posting?' do
    context 'posting is 5 days old' do
      let(:posting) { create(:posting, created_at: 5.days.ago) }
      
      it 'returns badge class' do
        expect(helper.new_posting?(posting)).to eq("<span class='badge'>NEW!</span>")
      end
    end
    
    context 'posting is 6 days old' do
      let(:posting) { create(:posting, created_at: 6.days.ago) }
      
      it 'returns nil' do
        expect(helper.new_posting?(posting)).to eq(nil)
      end
    end
  end
end