require 'rails_helper'

RSpec.describe Agreement, type: :model do

  it { is_expected.to belong_to(:user) }

  it_behaves_like 'id ordered'
  include_examples 'approval'

end
