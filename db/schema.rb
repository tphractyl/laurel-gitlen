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

ActiveRecord::Schema.define(version: 2014_08_13_011105) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "artists", id: :serial, force: :cascade do |t|
    t.string "name"
    t.text "bio"
    t.string "cv_link"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "cv_url"
    t.boolean "gallery_roster", default: true
    t.text "piece_order"
    t.string "press_url"
  end

  create_table "artists_exhibitions", id: :serial, force: :cascade do |t|
    t.integer "artist_id"
    t.integer "exhibition_id"
  end

  create_table "artists_stories", id: false, force: :cascade do |t|
    t.integer "artist_id", null: false
    t.integer "story_id", null: false
  end

  create_table "displays", id: false, force: :cascade do |t|
    t.integer "exhibition_id", null: false
    t.integer "piece_id", null: false
  end

  create_table "exhibitions", id: :serial, force: :cascade do |t|
    t.date "begins"
    t.date "ends"
    t.string "name"
    t.string "press_release_url"
    t.text "piece_order"
    t.string "artist_order"
    t.text "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "art_fair", default: false
    t.boolean "current", default: false
  end

  create_table "pieces", id: :serial, force: :cascade do |t|
    t.integer "artist_id"
    t.string "title"
    t.text "description"
    t.date "date"
    t.string "upload_url"
    t.string "upload_key"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.boolean "featured"
    t.index ["artist_id"], name: "index_pieces_on_artist_id"
  end

  create_table "stories", id: :serial, force: :cascade do |t|
    t.text "story"
    t.date "date"
    t.boolean "featured", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "press_release_url"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "username", null: false
    t.string "email"
    t.string "crypted_password"
    t.string "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
