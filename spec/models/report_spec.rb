require 'rails_helper'

RSpec.describe Report, type: :model do
  it { is_expected.to belong_to(:user) }

  it_behaves_like 'id ordered'
  include_examples 'approval'

  describe '#approve!' do
    let(:current_time) { Time.now }
    let(:development_objectives) { ['DEVELOPMENT OBJECTIVES'] }
    let(:smart_objectives) { ['SMART_OBJECTIVES'] }
    let(:comment) { 'COMMENT' }
    let(:attributes) { { development: development_objectives, smart: smart_objectives } }
    subject { described_class.new(attributes) }

    before do
      Timecop.freeze(current_time) do
        subject.approve!(stage, comment)
      end

      subject.reload
    end

    context 'for initial stage' do
      let(:stage) { :initial }

      it 'stores the time of approval as current time' do
        expect(subject.approved_at.to_i).to eql(current_time.to_i)
      end

      it 'stores the comment' do
        expect(subject.approved_comment).to eql(comment)
      end

      it 'stores a snapshot of the current development objectives' do
        expect(subject.approved_snapshot_development).to eql(subject.development)
      end

      it 'stores a snapshot of the current smart objectives' do
        expect(subject.approved_snapshot_smart).to eql(subject.smart)
      end
    end

    [:mid_year, :end_year].each do |stage|
      context "for #{stage} stage" do
        let(:stage) { stage }

        it 'stores the time of approval as current time' do
          expect(subject.send("#{stage}_approved_at").to_i).to eql(current_time.to_i)
        end

        it 'stores the comment' do
          expect(subject.send("#{stage}_approved_comment")).to eql(comment)
        end

        it 'stores a snapshot of the current development objectives' do
          expect(subject.send("#{stage}_approved_snapshot_development")).to eql(subject.development)
        end

        it 'stores a snapshot of the current smart objectives' do
          expect(subject.send("#{stage}_approved_snapshot_smart")).to eql(subject.smart)
        end
      end
    end
  end

end
