class CreatePriceChanges < ActiveRecord::Migration[7.2]
  def change
    create_table :price_changes do |t|
      t.belongs_to :changed_product, null: false, foreign_key: { to_table: 'products' }
      t.belongs_to :on_product, null: false, foreign_key: { to_table: 'products' }
      t.decimal :change, precision: 10, scale: 2, default: 0

      t.timestamps

      t.index [ :changed_product_id, :on_product_id ], unique: true
    end
  end
end
