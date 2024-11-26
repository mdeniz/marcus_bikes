class CreatePartOptions < ActiveRecord::Migration[7.2]
  def change
    create_table :part_options do |t|
      t.belongs_to :product, null: false, foreign_key: true
      t.belongs_to :customizable_part, null: false, foreign_key: true

      t.timestamps

      t.index [:product_id, :customizable_part_id], unique: true
    end
  end
end
