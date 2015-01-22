require 'rails_helper'

RSpec.describe Report, type: :model do
  describe 'default scope' do
    before do
      FactoryGirl.create(:report, id: 5)
      FactoryGirl.create(:report, id: 2)
    end

    it 'orders reports by id' do
      expect(described_class.all.pluck(:id)).to eql([2, 5])
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

  describe '#mid_year_approved?' do
    let(:attributes) { {} }
    subject { described_class.new(attributes).mid_year_approved? }

    context 'when mid_year_approved_at is set' do
      let(:attributes) { { mid_year_approved_at: 2.days.ago } }
      it { is_expected.to be true }
    end

    context 'when mid_year_approved_at is null' do
      it { is_expected.to be false }
    end
  end

  describe '#approve!' do
    let(:current_time) { Time.now }
    let(:development_objectives) { ['DEVELOPMENT OBJECTIVES'] }
    let(:smart_objectives) { ['SMART_OBJECTIVES'] }
    let(:comment) { 'COMMENT' }
    let(:attributes) { { development: development_objectives, smart: smart_objectives } }
    subject { described_class.new(attributes) }

    before do
      Timecop.freeze(current_time) do
        subject.approve!(stage, comment)
      end

      subject.reload
    end

    context 'for initial stage' do
      let(:stage) { :initial }

      it 'stores the time of approval as current time' do
        expect(subject.approved_at.to_i).to eql(current_time.to_i)
      end

      it 'stores the comment' do
        expect(subject.approved_comment).to eql(comment)
      end

      it 'stores a snapshot of the current development objectives' do
        expect(subject.approved_snapshot_development).to eql(subject.development)
      end

      it 'stores a snapshot of the current smart objectives' do
        expect(subject.approved_snapshot_smart).to eql(subject.smart)
      end
    end

    [:mid_year].each do |stage|
      context "for #{stage} stage" do
        let(:stage) { stage }

        it 'stores the time of approval as current time' do
          expect(subject.send("#{stage}_approved_at").to_i).to eql(current_time.to_i)
        end

        it 'stores the comment' do
          expect(subject.send("#{stage}_approved_comment")).to eql(comment)
        end

        it 'stores a snapshot of the current development objectives' do
          expect(subject.send("#{stage}_approved_snapshot_development")).to eql(subject.development)
        end

        it 'stores a snapshot of the current smart objectives' do
          expect(subject.send("#{stage}_approved_snapshot_smart")).to eql(subject.smart)
        end
      end
    end
  end
end
