require 'rails_helper'

RSpec.describe ReviewForm, type: :model do
  describe '.allowed_params' do
    subject { described_class.allowed_params }
    it 'returns list of allowed parameters' do
      expected_params = [
        'development_1',
        'development_2',
        'development_3',
        'development_4',
        'development_5',
        'development_6',
        'development_7',
        'development_8',
        'development_9',
        'development_10',
        'smart_what_1',
        'smart_what_2',
        'smart_what_3',
        'smart_what_4',
        'smart_what_5',
        'smart_what_6',
        'smart_what_7',
        'smart_what_8',
        'smart_what_9',
        'smart_what_10',
        'smart_how_1',
        'smart_how_2',
        'smart_how_3',
        'smart_how_4',
        'smart_how_5',
        'smart_how_6',
        'smart_how_7',
        'smart_how_8',
        'smart_how_9',
        'smart_how_10',
        'comment'
      ]

      is_expected.to match_array(expected_params)
    end
  end
end
