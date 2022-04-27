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

ActiveRecord::Schema[7.0].define(version: 2022_04_27_175923) do
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

  create_table "fix_orders", force: :cascade do |t|
    t.integer "order_id"
    t.decimal "rate", precision: 15, scale: 5
    t.decimal "amount", precision: 15, scale: 8
    t.string "error"
    t.integer "status", limit: 1, default: 4, null: false
    t.string "x_id"
    t.string "x_pair"
    t.integer "x_type", limit: 1
    t.decimal "x_done_amount", precision: 15, scale: 8
    t.decimal "x_rest_amount", precision: 15, scale: 8
    t.decimal "x_rate", precision: 15, scale: 5
    t.integer "x_timestamp"
    t.decimal "x_base", precision: 15, scale: 8
    t.decimal "x_quote", precision: 15, scale: 5
    t.integer "x_status", limit: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_fix_orders_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "run_id"
    t.decimal "rate", precision: 15, scale: 5
    t.decimal "amount", precision: 15, scale: 8
    t.decimal "fix_rate", precision: 15, scale: 5
    t.decimal "fix_amount", precision: 15, scale: 8
    t.string "error"
    t.integer "status", limit: 1, default: 4, null: false
    t.string "x_id"
    t.string "x_pair"
    t.integer "x_type", limit: 1
    t.decimal "x_done_amount", precision: 15, scale: 8
    t.decimal "x_rest_amount", precision: 15, scale: 8
    t.decimal "x_rate", precision: 15, scale: 5
    t.integer "x_timestamp"
    t.decimal "x_base", precision: 15, scale: 8
    t.decimal "x_quote", precision: 15, scale: 5
    t.integer "x_status", limit: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["run_id"], name: "index_orders_on_run_id"
  end

  create_table "pair_nicknames", force: :cascade do |t|
    t.integer "pair_id", null: false
    t.string "name"
    t.integer "status", limit: 1, default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_pair_nicknames_on_name", unique: true
    t.index ["pair_id"], name: "index_pair_nicknames_on_pair_id"
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

  create_table "runs", force: :cascade do |t|
    t.integer "pair_id"
    t.integer "kind", limit: 1, default: 0, null: false
    t.decimal "depo", precision: 15, scale: 5, null: false
    t.decimal "last", precision: 15, scale: 5, null: false
    t.float "indent", default: 10.0, null: false
    t.float "overlap", default: 10.0, null: false
    t.float "martingale", default: 15.0, null: false
    t.integer "orders_number", default: 10, null: false
    t.float "profit", default: 1.0, null: false
    t.integer "scale", limit: 1, default: 1, null: false
    t.decimal "stop_loss", precision: 15, scale: 5, null: false
    t.integer "status", limit: 1, default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pair_id"], name: "index_runs_on_pair_id"
  end

  create_table "trades", force: :cascade do |t|
    t.integer "pair_id", null: false
    t.integer "kind", limit: 1, default: 0, null: false
    t.decimal "rate", precision: 15, scale: 5
    t.decimal "amount", precision: 15, scale: 8
    t.integer "tid"
    t.datetime "timestamp", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pair_id"], name: "index_trades_on_pair_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "coin_nicknames", "coins"
  add_foreign_key "fix_orders", "orders"
  add_foreign_key "orders", "runs"
  add_foreign_key "pair_nicknames", "pairs"
  add_foreign_key "runs", "pairs"
  add_foreign_key "trades", "pairs"
end
