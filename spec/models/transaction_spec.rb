require 'rails_helper'

RSpec.describe Transaction do
  context 'validations' do
    it { is_expected.to validate_presence_of(:posting_id) }
    it { is_expected.to validate_presence_of(:user_id) }
    it { is_expected.to validate_presence_of(:status) }
    it { is_expected.to validate_presence_of(:transaction_id) }
    it { is_expected.to validate_presence_of(:amount) }
  end
end