require 'rails_helper'

describe PostingPolicy do
  subject { described_class }
  
  permissions :create? do
    context 'user is not signed in' do
      it "denies access" do
        expect(subject).not_to permit(Posting.create)
      end
    end
    
    context 'user is signed in ' do
      let(:user) { create(:user) }
      
      it 'allows access' do
        expect(subject).to permit(user, Posting.create)
      end
    end
  end
  
  permissions :new? do
    context 'user is not signed in' do
      it "denies access" do
        expect(subject).not_to permit(Posting.new)
      end
    end
    
    context 'user is signed in ' do
      let(:user) { create(:user) }
      
      it 'allows access' do
        expect(subject).to permit(user, Posting.new)
      end
    end    
  end
end
