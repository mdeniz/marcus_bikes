class CreateCustomizableAttributes < ActiveRecord::Migration[7.2]
  def change
    create_table :customizable_attributes do |t|
      t.string :name
      t.string :description
      t.integer :order, default: 1
      t.belongs_to :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
