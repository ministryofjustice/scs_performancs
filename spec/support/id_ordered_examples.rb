shared_examples 'id ordered' do
  describe 'default scope' do
    before do
      model = described_class.name.downcase.to_sym
      FactoryGirl.create(model, id: 5)
      FactoryGirl.create(model, id: 2)
    end

    it 'orders by id' do
      expect(described_class.all.pluck(:id)).to eql([2, 5])
    end
  end
end
