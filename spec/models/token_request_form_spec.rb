require 'rails_helper'

RSpec.describe TokenRequestForm, type: :model do
  it { is_expected.to validate_presence_of(:email)}
end