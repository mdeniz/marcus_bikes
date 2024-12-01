class CreateCartItems < ActiveRecord::Migration[7.2]
  def change
    create_table :cart_items do |t|
      t.belongs_to :cart, null: false, foreign_key: true
      t.belongs_to :product, null: false, foreign_key: true
      t.integer :order, default: 1
      t.integer :quantity, default: 1
      t.decimal :price, precision: 10, scale: 2, default: 0
      t.text :customization

      t.timestamps
    end
  end
end
