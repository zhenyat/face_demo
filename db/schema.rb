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

ActiveRecord::Schema[7.0].define(version: 2022_04_25_160105) do
  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "coin_nicknames", force: :cascade do |t|
    t.integer "coin_id", null: false
    t.string "name", null: false
    t.integer "status", limit: 1, default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["coin_id"], name: "index_coin_nicknames_on_coin_id"
    t.index ["name"], name: "index_coin_nicknames_on_name", unique: true
  end

  create_table "coins", force: :cascade do |t|
    t.string "name", null: false
    t.string "code", null: false
    t.integer "kind", limit: 1, default: 0, null: false
    t.string "unicode"
    t.integer "status", limit: 1, default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_coins_on_code", unique: true
    t.index ["name"], name: "index_coins_on_name", unique: true
  end

  create_table "pairs", force: :cascade do |t|
    t.integer "base_id"
    t.integer "quote_id"
    t.string "name", null: false
    t.string "code", null: false
    t.integer "level", limit: 1, default: 0, null: false
    t.integer "decimal_places"
    t.decimal "min_price", precision: 10, scale: 5
    t.decimal "max_price", precision: 10, scale: 5
    t.decimal "min_amount", precision: 10, scale: 5
    t.integer "hidden", limit: 1
    t.decimal "fee", precision: 5, scale: 2
    t.integer "status", limit: 1, default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["base_id"], name: "index_pairs_on_base_id"
    t.index ["code"], name: "index_pairs_on_code", unique: true
    t.index ["name"], name: "index_pairs_on_name", unique: true
    t.index ["quote_id"], name: "index_pairs_on_quote_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "coin_nicknames", "coins"
end
