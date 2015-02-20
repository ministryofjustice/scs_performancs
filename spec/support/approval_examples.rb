shared_examples 'approval' do

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

  describe '#end_year_approved?' do
    let(:attributes) { {} }
    subject { described_class.new(attributes).end_year_approved? }

    context 'when end_year_approved_at is set' do
      let(:attributes) { { end_year_approved_at: 1.days.ago } }
      it { is_expected.to be true }
    end

    context 'when end_year_approved_at is null' do
      it { is_expected.to be false }
    end
  end

end
