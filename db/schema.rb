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

ActiveRecord::Schema.define(version: 2022_09_19_190142) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "artist_events", force: :cascade do |t|
    t.bigint "artist_id"
    t.bigint "event_id"
    t.index ["artist_id"], name: "index_artist_events_on_artist_id"
    t.index ["event_id"], name: "index_artist_events_on_event_id"
  end

  create_table "artists", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.text "bio"
    t.string "genre"
    t.string "image_path"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.date "date"
    t.time "start_time"
    t.time "end_time"
    t.integer "booking_status", default: 0
    t.bigint "venue_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["venue_id"], name: "index_events_on_venue_id"
  end

  create_table "venue_artists", force: :cascade do |t|
    t.bigint "venue_id"
    t.bigint "artist_id"
    t.integer "booking_status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artist_id"], name: "index_venue_artists_on_artist_id"
    t.index ["venue_id"], name: "index_venue_artists_on_venue_id"
  end

  create_table "venues", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.string "phone"
    t.string "price"
    t.string "category"
    t.integer "rating"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "artist_events", "artists"
  add_foreign_key "artist_events", "events"
  add_foreign_key "events", "venues"
  add_foreign_key "venue_artists", "artists"
  add_foreign_key "venue_artists", "venues"
end
