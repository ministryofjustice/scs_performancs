require 'rails_helper'

RSpec.describe ObjectivesForm, type: :model do
  let(:attributes) { {} }
  subject(:report_form) { described_class.new(attributes) }

  describe '#development_as_json' do
    subject { report_form.development_as_json }

    context 'when some development attributes are set' do
      let(:attributes) { { development_1: 'Objective 1', development_5: 'Objective 5' } }

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

  describe '#smart_as_json' do
    subject { report_form.smart_as_json }

    context 'when some smart attributes are set' do
      let(:attributes) { { smart_what_1: 'Smart what 1', smart_how_1: 'Smart how 1', smart_how_4: 'Smart how 4' } }

      it 'return array of all 10 smart objectives' do
        is_expected.to match_array([
          { what: 'Smart what 1', how: 'Smart how 1' },
          { what: '', how: '' },
          { what: '', how: '' },
          { what: '', how: 'Smart how 4' },
          { what: '', how: '' },
          { what: '', how: '' },
          { what: '', how: '' },
          { what: '', how: '' },
          { what: '', how: '' },
          { what: '', how: '' }
        ])
      end
    end

    context 'when no development attributes are set' do
      it 'return array of 10 empty what and how hashes' do
        is_expected.to match_array([{ what: '', how: '' }] * 10)
      end
    end
  end
end
