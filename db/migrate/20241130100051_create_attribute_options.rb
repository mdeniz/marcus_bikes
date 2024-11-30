class CreateAttributeOptions < ActiveRecord::Migration[7.2]
  def change
    create_table :attribute_options do |t|
      t.string :name
      t.string :description
      t.integer :order, default: 1
      t.belongs_to :customizable_attribute, null: false, foreign_key: true

      t.timestamps
    end
  end
end
