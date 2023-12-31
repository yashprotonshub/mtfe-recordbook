# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2023_07_21_160704) do

  create_table "accounts", force: :cascade do |t|
    t.string "name"
    t.integer "base_amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "records", force: :cascade do |t|
    t.float "current_value"
    t.float "last_value", default: 0.0
    t.string "diffrence"
    t.integer "account_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "added_commision", default: 0.0
    t.float "total_commision", default: 0.0
    t.float "grand_total_without_commision", default: 0.0
    t.float "grand_total", default: 0.0
    t.index ["account_id"], name: "index_records_on_account_id"
  end

end
