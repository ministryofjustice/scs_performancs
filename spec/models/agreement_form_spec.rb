require 'rails_helper'

RSpec.describe AgreementForm, type: :model do
  let(:attributes) { {} }
  subject(:agreement_form) { described_class.new(attributes) }

  describe '#objective_as_json' do
    subject { agreement_form.objective_as_json }

    context 'when some objective attributes are set' do
      let(:attributes) { { what_1: 'Objective what 1', how_1: 'Objective how 1', how_4: 'Objective how 4' } }

      it 'return array of all 10 objectives' do
        is_expected.to match_array([
          { type: nil, what: 'Objective what 1', how: 'Objective how 1', deliverable: nil, measurement: nil },
          { type: nil, what: nil, how: nil, deliverable: nil, measurement: nil },
          { type: nil, what: nil, how: nil, deliverable: nil, measurement: nil },
          { type: nil, what: nil, how: 'Objective how 4', deliverable: nil, measurement: nil },
          { type: nil, what: nil, how: nil, deliverable: nil, measurement: nil },
          { type: nil, what: nil, how: nil, deliverable: nil, measurement: nil },
          { type: nil, what: nil, how: nil, deliverable: nil, measurement: nil },
          { type: nil, what: nil, how: nil, deliverable: nil, measurement: nil },
          { type: nil, what: nil, how: nil, deliverable: nil, measurement: nil },
          { type: nil, what: nil, how: nil, deliverable: nil, measurement: nil }
        ])
      end
    end

    context 'when no objective attributes are set' do
      it 'return array of 10 empty hashes' do
        is_expected.to match_array([{ type: nil, what: nil, how: nil, deliverable: nil, measurement: nil }] * 10)
      end
    end

  end

  describe 'allowed_params' do
    subject { described_class.allowed_params }
    it 'returns list of allowed parameters' do
      expected_params = [
        "type_1", "what_1", "how_1", "deliverable_1", "measurement_1",
        "type_2", "what_2", "how_2", "deliverable_2", "measurement_2",
        "type_3", "what_3", "how_3", "deliverable_3", "measurement_3",
        "type_4", "what_4", "how_4", "deliverable_4", "measurement_4",
        "type_5", "what_5", "how_5", "deliverable_5", "measurement_5",
        "type_6", "what_6", "how_6", "deliverable_6", "measurement_6",
        "type_7", "what_7", "how_7", "deliverable_7", "measurement_7",
        "type_8", "what_8", "how_8", "deliverable_8", "measurement_8",
        "type_9", "what_9", "how_9", "deliverable_9", "measurement_9",
        "type_10", "what_10", "how_10", "deliverable_10", "measurement_10"]

      is_expected.to match_array(expected_params)
    end
  end
end
