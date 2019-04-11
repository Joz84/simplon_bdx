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

ActiveRecord::Schema.define(version: 2019_04_10_225035) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "batches", force: :cascade do |t|
    t.string "name"
    t.date "start_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "daily_seances", force: :cascade do |t|
    t.bigint "seance_id"
    t.bigint "batch_id"
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["batch_id"], name: "index_daily_seances_on_batch_id"
    t.index ["seance_id"], name: "index_daily_seances_on_seance_id"
  end

  create_table "feelings", force: :cascade do |t|
    t.bigint "user_id"
    t.date "date"
    t.integer "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_feelings_on_user_id"
  end

  create_table "pair_users", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "pair_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pair_id"], name: "index_pair_users_on_pair_id"
    t.index ["user_id"], name: "index_pair_users_on_user_id"
  end

  create_table "pairs", force: :cascade do |t|
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "seances", force: :cascade do |t|
    t.integer "position"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "animal"
    t.string "adjective"
    t.string "avatar"
    t.text "description"
    t.date "birthday"
    t.bigint "batch_id"
    t.index ["batch_id"], name: "index_users_on_batch_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "daily_seances", "batches"
  add_foreign_key "daily_seances", "seances"
  add_foreign_key "feelings", "users"
  add_foreign_key "pair_users", "pairs"
  add_foreign_key "pair_users", "users"
  add_foreign_key "users", "batches"
end
