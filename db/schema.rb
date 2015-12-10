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

ActiveRecord::Schema.define(version: 20151210033406) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "books", force: :cascade do |t|
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "title"
    t.text     "description"
    t.date     "pubdate"
    t.string   "isbn"
    t.integer  "stock"
    t.boolean  "can_order"
  end

  create_table "composers", force: :cascade do |t|
    t.string   "fname"
    t.string   "lname"
    t.text     "bio"
    t.string   "city"
    t.string   "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "composers_books", id: false, force: :cascade do |t|
    t.integer "book_id"
    t.integer "composer_id"
  end

  create_table "musics", force: :cascade do |t|
    t.string   "title"
    t.boolean  "digital"
    t.boolean  "physical"
    t.string   "itunes"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.date     "released"
    t.text     "description"
    t.string   "barcode"
    t.integer  "stock"
    t.boolean  "can_order"
  end

  create_table "musics_composers", id: false, force: :cascade do |t|
    t.integer "composer_id"
    t.integer "music_id"
  end

  create_table "tracks", force: :cascade do |t|
    t.string   "title"
    t.integer  "length"
    t.string   "artist"
    t.integer  "number"
    t.string   "isrc"
    t.integer  "music_id"
    t.integer  "ccli"
    t.string   "authors"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
