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

ActiveRecord::Schema.define(version: 20140508155347) do

  create_table "colors", force: true do |t|
    t.string   "hex"
    t.integer  "r"
    t.integer  "g"
    t.integer  "b"
    t.integer  "hue"
    t.integer  "val"
    t.integer  "sat"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "relationships", force: true do |t|
    t.integer  "url_id"
    t.integer  "color_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "top_caches", force: true do |t|
    t.integer  "color_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "type_caches", force: true do |t|
    t.integer  "urltype_id"
    t.integer  "color_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "url_type_relationships", force: true do |t|
    t.integer  "url_id"
    t.integer  "urltype_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "urls", force: true do |t|
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "urltypes", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
