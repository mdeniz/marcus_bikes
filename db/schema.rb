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

ActiveRecord::Schema[7.2].define(version: 2024_12_01_001013) do
  create_table "attribute_options", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "order", default: 1
    t.decimal "price_change", precision: 10, scale: 2, default: "0.0"
    t.boolean "stock_available", default: false
    t.integer "customizable_attribute_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customizable_attribute_id"], name: "index_attribute_options_on_customizable_attribute_id"
  end

  create_table "banned_combinations", force: :cascade do |t|
    t.integer "source_id", null: false
    t.integer "target_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["source_id", "target_id"], name: "index_banned_combinations_on_source_id_and_target_id", unique: true
    t.index ["source_id"], name: "index_banned_combinations_on_source_id"
    t.index ["target_id"], name: "index_banned_combinations_on_target_id"
  end

  create_table "cart_items", force: :cascade do |t|
    t.integer "cart_id", null: false
    t.integer "product_id", null: false
    t.integer "order", default: 1
    t.integer "quantity", default: 1
    t.decimal "price", precision: 10, scale: 2, default: "0.0"
    t.text "customization"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cart_id"], name: "index_cart_items_on_cart_id"
    t.index ["product_id"], name: "index_cart_items_on_product_id"
  end

  create_table "carts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "order", default: 1
    t.integer "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parent_id"], name: "index_categories_on_parent_id"
  end

  create_table "customizable_attributes", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "order", default: 1
    t.integer "product_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_customizable_attributes_on_product_id"
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

  create_table "price_changes", force: :cascade do |t|
    t.integer "changed_product_id", null: false
    t.integer "on_product_id", null: false
    t.decimal "change", precision: 10, scale: 2, default: "0.0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["changed_product_id", "on_product_id"], name: "index_price_changes_on_changed_product_id_and_on_product_id", unique: true
    t.index ["changed_product_id"], name: "index_price_changes_on_changed_product_id"
    t.index ["on_product_id"], name: "index_price_changes_on_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "uuid"
    t.string "brand"
    t.string "model"
    t.string "description"
    t.decimal "base_price", precision: 10, scale: 2
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

  add_foreign_key "attribute_options", "customizable_attributes"
  add_foreign_key "banned_combinations", "products", column: "source_id"
  add_foreign_key "banned_combinations", "products", column: "target_id"
  add_foreign_key "cart_items", "carts"
  add_foreign_key "cart_items", "products"
  add_foreign_key "categories", "categories", column: "parent_id"
  add_foreign_key "customizable_attributes", "products"
  add_foreign_key "customizable_parts", "products"
  add_foreign_key "part_options", "customizable_parts"
  add_foreign_key "part_options", "products"
  add_foreign_key "price_changes", "products", column: "changed_product_id"
  add_foreign_key "price_changes", "products", column: "on_product_id"
  add_foreign_key "products", "categories"
end
