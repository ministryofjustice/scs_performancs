require 'rails_helper'

RSpec.describe Token, type: :model do
  subject { described_class.new }

  it { is_expected.to belong_to(:user) }
  it { is_expected.to validate_presence_of(:user) }
  it { is_expected.to validate_presence_of(:value) }

  describe '#initialize' do
    it 'generates a random value' do
      expect(subject.value).not_to be_empty
    end
  end

  describe '#to_param' do
    it 'returns the value of the token' do
      expect(subject.to_param).to eql(subject.value)
    end
  end
end
