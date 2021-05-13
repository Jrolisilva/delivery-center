class CreateClients < ActiveRecord::Migration[6.1]
  def change
    create_table :clients do |t|
      t.text :external_code, null: false, index: { unique: true }
      t.string :name
      t.text :email, null: false, index: { unique: true }
      t.string :contact


      t.timestamps
    end
  end
end
