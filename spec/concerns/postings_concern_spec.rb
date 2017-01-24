require 'rails_helper'

RSpec.describe PostingsConcern do
  context '#grouped_postings' do
    let!(:programming_posting_1) { create(:posting, :programming, expired: false) }
    let!(:programmign_posting_2) { create(:posting, :programming, expired: false) }
    let!(:marketing_posting) { create(:posting, :marketing, expired: false) }
    
    it 'sets expired attribute to true' do
      hash = described_class.grouped_postings
      
      expect(hash["programming"].length).to eq(2)
      expect(hash["marketing"].length).to eq(1)
    end
  end
end
