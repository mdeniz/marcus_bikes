class CreateProducts < ActiveRecord::Migration[7.2]
  def change
    create_table :products do |t|
      t.string :uuid, index: { unique: true, name: "unique_uuid_on_products" }
      t.string :brand
      t.string :model
      t.string :description
      t.decimal :standalone_price, precision: 10, scale: 2
      t.string :image
      t.integer :year
      t.boolean :enabled, default: false
      t.boolean :stock_available, default: false
      t.boolean :customizable, default: false
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
