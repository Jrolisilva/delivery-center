class CreateShippingAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :shipping_addresses do |t|
      t.string :country
      t.string :state
      t.string :city
      t.string :district
      t.string :street
      t.string :complement
      t.decimal :latitude
      t.decimal :longitude
      t.string :postal_code
      t.string :number
      t.belongs_to :client, null: false, foreign_key:true

      t.timestamps
    end
  end
end
