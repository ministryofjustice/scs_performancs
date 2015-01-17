require 'rails_helper'

RSpec.describe Report, type: :model do

  describe 'default scope' do
    before do
      FactoryGirl.create(:report, id: 5)
      FactoryGirl.create(:report, id: 2)
    end

    it 'orders reports by id' do
      expect(Report.all.pluck(:id)).to eql([2, 5])
    end
  end

  describe '#approved?' do
    let(:attributes) { {} }
    subject { described_class.new(attributes).approved? }

    context 'when approved_at is set' do
      let(:attributes) { { approved_at: Time.now } }
      it { is_expected.to be true }
    end

    context 'when approved_at is null' do
      it { is_expected.to be false }
    end
  end
end
