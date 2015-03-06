require 'rails_helper'

RSpec.describe ReportFormFactory, type: :model do
  subject(:factory) { described_class.new(management_report) }

  describe '#objectives' do
    let(:management_report) { FactoryGirl.create(:filled_in_report) }
    subject { factory.objectives }

    it 'returns correct form object' do
      is_expected.to be_a(ObjectivesForm)
    end

    it 'assigns development objectives to the form object' do
      expect(subject.development_1).to eql(management_report.development[0])
    end

    it 'assigns smart objectives to the form object' do
      expect(subject.smart_what_1).to eql(management_report.smart[0]['what'])
      expect(subject.smart_how_1).to eql(management_report.smart[0]['how'])
    end

    it 'assigns review_period' do
      expect(subject.review_period).to eq(management_report.review_period)
    end
  end

  describe '#review' do
    let(:management_report) { FactoryGirl.create(:report_with_mid_year_review) }
    let(:type) { :mid_year }
    subject { factory.review(type) }

    it 'returns correct form object' do
      is_expected.to be_a(ReviewForm)
    end

    context 'for mid year review' do
      it 'assigns mid year development review to the form object' do
        expect(subject.development_1).to eql(management_report.mid_year_review_development[0])
      end

      it 'assigns mid year smart review to the form object' do
        expect(subject.smart_what_1).to eql(management_report.mid_year_review_smart[0]['what'])
        expect(subject.smart_how_1).to eql(management_report.mid_year_review_smart[0]['how'])
      end

      it 'assigns mid year comment to the form object' do
        expect(subject.comment).to eql(management_report.mid_year_review_comment)
      end
    end
  end
end
