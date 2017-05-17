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

ActiveRecord::Schema.define(version: 20170517224600) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "order_details", primary_key: ["ordernumber", "productnumber"], force: :cascade do |t|
    t.integer "ordernumber",                                        default: 0,     null: false
    t.integer "productnumber",                                      default: 0,     null: false
    t.decimal "quotedprice",               precision: 15, scale: 2, default: "0.0"
    t.integer "quantityordered", limit: 2,                          default: 0
    t.index ["ordernumber"], name: "ordersorderdetails", using: :btree
    t.index ["productnumber"], name: "productsorderdetails", using: :btree
  end

  create_table "orders", primary_key: "ordernumber", id: :integer, default: 0, force: :cascade do |t|
    t.date    "orderdate"
    t.date    "shipdate"
    t.integer "customerid", default: 0
    t.integer "employeeid", default: 0
    t.index ["customerid"], name: "customerid", using: :btree
    t.index ["employeeid"], name: "employeeid", using: :btree
  end

  create_table "product_vendors", primary_key: ["productnumber", "vendorid"], force: :cascade do |t|
    t.integer "productnumber",                                     default: 0,     null: false
    t.integer "vendorid",                                          default: 0,     null: false
    t.decimal "wholesaleprice",           precision: 15, scale: 2, default: "0.0"
    t.integer "daystodeliver",  limit: 2,                          default: 0
    t.index ["productnumber"], name: "productsproductvendors", using: :btree
    t.index ["vendorid"], name: "vendorid", using: :btree
  end

  create_table "projects", force: :cascade do |t|
    t.text     "title"
    t.text     "description"
    t.text     "image_url"
    t.decimal  "target_amount"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "users", force: :cascade do |t|
    t.integer  "role"
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "ztblpurchasecoupons", primary_key: "lowspend", id: :decimal, precision: 15, scale: 2, force: :cascade do |t|
    t.decimal "highspend",            precision: 15, scale: 2
    t.integer "numcoupons", limit: 2,                          default: 0
    t.index ["numcoupons"], name: "num_coupons", using: :btree
  end

  create_table "ztblseqnumbers", primary_key: "sequence", id: :integer, default: 0, force: :cascade do |t|
  end

end
