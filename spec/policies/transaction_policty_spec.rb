require 'rails_helper'

describe TransactionPolicy do
  subject { described_class }
  
  permissions :create? do
    context 'user is not signed in' do
      it "denies access" do
        expect(subject).not_to permit(Transaction.create)
      end
    end
    
    context 'user is signed in ' do
      let(:user) { create(:user) }
      
      it 'allows access' do
        expect(subject).to permit(user, Transaction.create)
      end
    end
  end
end
