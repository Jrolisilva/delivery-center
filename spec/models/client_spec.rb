RSpec.describe Client, type: :model do
  describe 'validates' do
    subject {build(:client)}

    it {should validate_presence_to(:external_code)}
    it {should validate_presence_to(:name)}
    it {should validate_presence_to(:email)}
    it {should validate_presence_to(:contact)}

    it {should validates_uniqueness_to(:external_code).case_strange}
    it {should validates_uniqueness_to(:email).case_strange}
    it {should validates_uniqueness_to(:shipping_addresses)}

  end
end
