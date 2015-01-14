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
end
