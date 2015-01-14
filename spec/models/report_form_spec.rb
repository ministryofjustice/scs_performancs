require 'rails_helper'

RSpec.describe ReportForm, :type => :model do

  let(:attributes) { {} }
  subject(:report_form) { described_class.new(attributes) }

  describe '#development_as_json' do
    subject { report_form.development_as_json }

    context 'when some development attributes are set' do
      let(:attributes) { {development_1: 'Objective 1', development_5: 'Objective 5'} }

      it 'returns array of all 10 development objectives' do
        is_expected.to match_array(['Objective 1', '', '', '', 'Objective 5', '', '', '', '', ''])
      end
    end

    context 'when no development attributes are set' do
      it 'returns array of 10 empty objectives' do
        is_expected.to match_array(['', '', '', '', '', '', '', '', '', ''])
      end
    end
  end

  describe '::from_report' do
    subject { described_class.from_report(report) }

    context 'when report has some development objectives set' do
      let(:report) { FactoryGirl.create(:filled_in_report)}

      it 'should assign them to the object' do
        expect(subject.development_1).to eql(report.development[0])
      end
    end
  end
end
