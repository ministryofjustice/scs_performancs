require 'rails_helper'

RSpec.describe User, type: :model do
  subject { described_class.new }

  it { is_expected.to have_many(:tokens) }
  it { is_expected.to have_many(:reports) }
  it { is_expected.to have_many(:employees_reports).through(:employees).source(:reports) }

  context "to_s" do
    it "uses name if available" do
      subject.name = 'John Doe'
      expect(subject.to_s).to eql('John Doe')
    end

    it "uses email if name is unavailable" do
      subject.email = 'user@example.com'
      expect(subject.to_s).to eql('user@example.com')
    end
  end

  it 'normalises email on assignment' do
    subject.email = 'USER@Example.com'
    expect(subject.email).to eql('user@example.com')
  end

  context 'with only a end-year approved report' do
    before do
      subject.reports << FactoryGirl.build(:report_with_end_year_approved)
    end

    describe '.report_open?' do
      it 'returns false' do
        expect(subject.report_open?).to be_falsey
      end
    end

    describe '.open_report' do
      it 'returns nil' do
        expect(subject.open_report).to be_nil
      end
    end
  end

  context 'with a report not end-year approved' do
    let(:report) { FactoryGirl.build(:report_with_mid_year_approved) }

    before do
      subject.reports << report
    end

    describe '.report_open?' do
      it 'returns true' do
        expect(subject.report_open?).to be_truthy
      end
    end

    describe '.open_report' do
      it 'returns report' do
        expect(subject.open_report).to eq(report)
      end
    end
  end

end
