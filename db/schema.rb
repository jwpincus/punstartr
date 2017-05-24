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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 20170524200637) do
=======
ActiveRecord::Schema.define(version: 20170524214342) do
>>>>>>> staging

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cities", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "country_id"
    t.index ["country_id"], name: "index_cities_on_country_id", using: :btree
  end

  create_table "countries", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "project_backers", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "project_id"
    t.integer  "reward_id"
    t.integer  "pledge_amount"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["project_id"], name: "index_project_backers_on_project_id", using: :btree
    t.index ["reward_id"], name: "index_project_backers_on_reward_id", using: :btree
    t.index ["user_id"], name: "index_project_backers_on_user_id", using: :btree
  end

  create_table "project_owners", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_project_owners_on_project_id", using: :btree
    t.index ["user_id"], name: "index_project_owners_on_user_id", using: :btree
  end

  create_table "projects", force: :cascade do |t|
    t.text     "title"
    t.text     "description"
    t.text     "image_url"
    t.integer  "target_amount"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "category_id"
    t.datetime "completion_date"
    t.string   "slug"
    t.integer  "country_id"
    t.integer  "city_id"
    t.index ["category_id"], name: "index_projects_on_category_id", using: :btree
    t.index ["city_id"], name: "index_projects_on_city_id", using: :btree
    t.index ["country_id"], name: "index_projects_on_country_id", using: :btree
  end

  create_table "rewards", force: :cascade do |t|
    t.string  "title"
    t.text    "description"
    t.decimal "pledge_amount"
    t.integer "limit"
    t.integer "project_id"
    t.index ["project_id"], name: "index_rewards_on_project_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",            null: false
    t.string   "crypted_password"
    t.string   "salt"
    t.string   "name"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "phone"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
  end

  add_foreign_key "cities", "countries"
  add_foreign_key "project_backers", "projects"
  add_foreign_key "project_backers", "rewards"
  add_foreign_key "project_backers", "users"
  add_foreign_key "project_owners", "projects"
  add_foreign_key "project_owners", "users"
  add_foreign_key "projects", "categories"
  add_foreign_key "projects", "cities"
  add_foreign_key "projects", "countries"
  add_foreign_key "rewards", "projects"
end
