# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.2].define(version: 2024_11_26_174604) do
  create_table "banned_combinations", force: :cascade do |t|
    t.integer "source_id", null: false
    t.integer "destination_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["destination_id"], name: "index_banned_combinations_on_destination_id"
    t.index ["source_id", "destination_id"], name: "index_banned_combinations_on_source_id_and_destination_id", unique: true
    t.index ["source_id"], name: "index_banned_combinations_on_source_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "order"
    t.integer "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parent_id"], name: "index_categories_on_parent_id"
  end

  create_table "customizable_parts", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "order", default: 1
    t.integer "product_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_customizable_parts_on_product_id"
  end

  create_table "part_options", force: :cascade do |t|
    t.integer "product_id", null: false
    t.integer "customizable_part_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customizable_part_id"], name: "index_part_options_on_customizable_part_id"
    t.index ["product_id", "customizable_part_id"], name: "index_part_options_on_product_id_and_customizable_part_id", unique: true
    t.index ["product_id"], name: "index_part_options_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "uuid"
    t.string "brand"
    t.string "model"
    t.string "description"
    t.decimal "price", precision: 10, scale: 2
    t.string "image"
    t.integer "year"
    t.boolean "enabled", default: false
    t.boolean "stock_available", default: false
    t.boolean "customizable", default: false
    t.integer "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_products_on_category_id"
    t.index ["uuid"], name: "unique_uuid_on_products", unique: true
  end

  add_foreign_key "banned_combinations", "products", column: "destination_id"
  add_foreign_key "banned_combinations", "products", column: "source_id"
  add_foreign_key "categories", "categories", column: "parent_id"
  add_foreign_key "customizable_parts", "products"
  add_foreign_key "part_options", "customizable_parts"
  add_foreign_key "part_options", "products"
  add_foreign_key "products", "categories"
end
