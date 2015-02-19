require 'rails_helper'

RSpec.describe AgreementForm, type: :model do
  let(:attributes) { {} }
  subject(:agreement_form) { described_class.new(attributes) }

  describe '#objective_as_json' do
    subject { agreement_form.objective_as_json }

    context 'when some objective attributes are set' do
      let(:attributes) { { objective_what_1: 'Objective what 1', objective_how_1: 'Objective how 1', objective_how_4: 'Objective how 4' } }

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
        "objective_type_1", "objective_what_1", "objective_how_1", "objective_deliverable_1", "objective_measurement_1",
        "objective_type_2", "objective_what_2", "objective_how_2", "objective_deliverable_2", "objective_measurement_2",
        "objective_type_3", "objective_what_3", "objective_how_3", "objective_deliverable_3", "objective_measurement_3",
        "objective_type_4", "objective_what_4", "objective_how_4", "objective_deliverable_4", "objective_measurement_4",
        "objective_type_5", "objective_what_5", "objective_how_5", "objective_deliverable_5", "objective_measurement_5",
        "objective_type_6", "objective_what_6", "objective_how_6", "objective_deliverable_6", "objective_measurement_6",
        "objective_type_7", "objective_what_7", "objective_how_7", "objective_deliverable_7", "objective_measurement_7",
        "objective_type_8", "objective_what_8", "objective_how_8", "objective_deliverable_8", "objective_measurement_8",
        "objective_type_9", "objective_what_9", "objective_how_9", "objective_deliverable_9", "objective_measurement_9",
        "objective_type_10", "objective_what_10", "objective_how_10", "objective_deliverable_10", "objective_measurement_10"]

      is_expected.to match_array(expected_params)
    end
  end
end
