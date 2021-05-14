

RSpec.describe Product, type: :model do
  describe 'validates' do
    subject {build(:product)}

    it {should validate_presence_to(:external_code)}
    it {should validate_presence_to(:name)}
    it {should validate_presence_to(:price)}
    it {should validate_presence_to(:quantity)}
    it {should validate_presence_to(:total)}

    it {should has_many(:orders)}

    describe 'total_value' do
      subject {build(:product, total: total, price: price, quantity: quantity)}

      context 'if equal to sum of prices' do
        let(:total) {50.0}
        let(:price) {25.0}
        let(:quantity) {2}

        it { expect.to be_valid}
      end

      context 'if different sum of prices' do
        expect(subject).to be_valid
        expect(subject.error).to eq(['Total must be equal to sum of the prices'])
      end
    end
  end 
end
