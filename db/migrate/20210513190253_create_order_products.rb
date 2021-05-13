class CreateOrderProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :order_products do |t|
      t.text :external_code, null: false, index: { unique: true }
      t.string :name
      t.integer :quantity
      t.decimal :price, precision: 8, scale: 2
      t.decimal :total, precision: 8, scale: 2

      t.timestamps
    end
  end
end
