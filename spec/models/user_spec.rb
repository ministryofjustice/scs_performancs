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

end
