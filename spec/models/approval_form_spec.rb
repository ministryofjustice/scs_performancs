require 'rails_helper'

RSpec.describe ApprovalForm, type: :model do
  describe '.allowed_params' do
    subject { described_class.allowed_params }
    it 'returns list of allowed parameters' do
      expected_params = ['comment']

      is_expected.to match_array(expected_params)
    end
  end
end
