class CreateBannedCombinations < ActiveRecord::Migration[7.2]
  def change
    create_table :banned_combinations do |t|
      t.belongs_to :source, null: false, foreign_key: { to_table: 'products' }
      t.belongs_to :destination, null: false, foreign_key: { to_table: 'products' }

      t.timestamps

      t.index [ :source_id, :destination_id ], unique: true
    end
  end
end
