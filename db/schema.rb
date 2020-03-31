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

ActiveRecord::Schema.define(version: 2020_03_30_171533) do

  create_table "art_logs", force: :cascade do |t|
    t.integer "user_id"
    t.integer "exhb_log_id"
    t.integer "art_id"
    t.integer "star"
    t.text "body"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["art_id"], name: "index_art_logs_on_art_id"
    t.index ["exhb_log_id"], name: "index_art_logs_on_exhb_log_id"
    t.index ["user_id"], name: "index_art_logs_on_user_id"
  end

  create_table "artists", force: :cascade do |t|
    t.string "name"
    t.string "place"
    t.integer "birth_year"
    t.integer "death_year"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "arts", force: :cascade do |t|
    t.integer "exhibition_id"
    t.integer "number"
    t.integer "artist_id"
    t.string "name"
    t.integer "year"
    t.string "image"
    t.float "star"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artist_id"], name: "index_arts_on_artist_id"
    t.index ["exhibition_id"], name: "index_arts_on_exhibition_id"
  end

  create_table "exhb_logs", force: :cascade do |t|
    t.integer "user_id"
    t.integer "exhibition_id"
    t.float "star"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["exhibition_id"], name: "index_exhb_logs_on_exhibition_id"
    t.index ["user_id"], name: "index_exhb_logs_on_user_id"
  end

  create_table "exhibitions", force: :cascade do |t|
    t.integer "museum_id"
    t.string "name"
    t.date "start_date"
    t.date "end_date"
    t.text "fee"
    t.string "closing_day"
    t.string "opening_hours"
    t.string "phone"
    t.string "organizer"
    t.string "website"
    t.string "image"
    t.float "star"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["museum_id"], name: "index_exhibitions_on_museum_id"
  end

  create_table "museums", force: :cascade do |t|
    t.integer "prefecture_id"
    t.string "name"
    t.string "address"
    t.string "phone"
    t.string "website"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["prefecture_id"], name: "index_museums_on_prefecture_id"
  end

  create_table "prefectures", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "username"
    t.string "display_name"
    t.text "bio"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
