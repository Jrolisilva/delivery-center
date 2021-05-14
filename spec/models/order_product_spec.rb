RSpec.describe OrderProduct, type: :model do
    describe 'validates' do
      subject{ build(:order_product)}

      it{should belongs_to(:order)}
      it{should belongs_to(:product)}

    end
end
