class CreateCategories < ActiveRecord::Migration[7.2]
  def change
    create_table :categories do |t|
      t.string :name
      t.string :description
      t.integer :order, default: 1
      t.belongs_to :parent, null: true, foreign_key: { to_table: 'categories' }

      t.timestamps
    end
  end
end
