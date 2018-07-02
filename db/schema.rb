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

ActiveRecord::Schema.define(version: 20180701135051) do

  create_table "accesslog_in_words", force: :cascade do |t|
    t.integer  "accesslog_id"
    t.integer  "word_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "accesslog_in_words", ["accesslog_id"], name: "index_accesslog_in_words_on_accesslog_id"
  add_index "accesslog_in_words", ["word_id"], name: "index_accesslog_in_words_on_word_id"

  create_table "accesslogs", force: :cascade do |t|
    t.string   "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rsspages", force: :cascade do |t|
    t.string   "title"
    t.text     "url"
    t.text     "description"
    t.integer  "rsssite_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "rsspages", ["rsssite_id"], name: "index_rsspages_on_rsssite_id"

  create_table "rsssites", force: :cascade do |t|
    t.string   "name"
    t.text     "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "words", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
