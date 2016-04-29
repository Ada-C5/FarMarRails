# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160426222728) do

  create_table "markets", force: :cascade do |t|
    t.integer  "market_id"
    t.string   "market_name", null: false
    t.string   "address",     null: false
    t.string   "city",        null: false
    t.string   "county"
    t.string   "state",       null: false
    t.integer  "zip"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "products", force: :cascade do |t|
    t.integer  "product_id"
    t.string   "product_name", null: false
    t.integer  "vendor_id",    null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "sales", force: :cascade do |t|
    t.integer  "sale_id"
    t.integer  "amount",        null: false
    t.datetime "purchase_time"
    t.integer  "vendor_id",     null: false
    t.integer  "product_id",    null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "vendors", force: :cascade do |t|
    t.integer  "vendor_id"
    t.string   "vendor_name",      null: false
    t.integer  "num_of_employees", null: false
    t.integer  "market_id",        null: false
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

end
