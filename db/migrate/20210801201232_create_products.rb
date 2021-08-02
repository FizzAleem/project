class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.references :account
      t.string :name, null: false
      t.decimal :price, null: false, precision: 15, scale: 2
      t.text :description

      t.timestamps
    end
  end
end
