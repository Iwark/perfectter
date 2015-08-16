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

ActiveRecord::Schema.define(version: 20150816094828) do

  create_table "accounts", force: :cascade do |t|
    t.string   "tid",                          limit: 255
    t.string   "name",                         limit: 255
    t.string   "screen_name",                  limit: 255
    t.text     "description",                  limit: 65535
    t.string   "description_url",              limit: 255
    t.boolean  "is_protected",                 limit: 1
    t.integer  "followers_count",              limit: 4
    t.integer  "friends_count",                limit: 4
    t.integer  "favourites_count",             limit: 4
    t.integer  "statuses_count",               limit: 4
    t.text     "status",                       limit: 65535
    t.string   "profile_background_image_url", limit: 255
    t.string   "profile_image_url",            limit: 255
    t.boolean  "profile_use_background_image", limit: 1
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  create_table "followers", force: :cascade do |t|
    t.integer  "account_id", limit: 4
    t.string   "tid",        limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "followers", ["account_id"], name: "index_followers_on_account_id", using: :btree
  add_index "followers", ["tid"], name: "index_followers_on_tid", using: :btree

  create_table "friends", force: :cascade do |t|
    t.integer  "account_id", limit: 4
    t.string   "tid",        limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "friends", ["account_id"], name: "index_friends_on_account_id", using: :btree
  add_index "friends", ["tid"], name: "index_friends_on_tid", using: :btree

  create_table "twitter_apis", force: :cascade do |t|
    t.string   "api_key",             limit: 255
    t.string   "api_secret",          limit: 255
    t.string   "access_token",        limit: 255
    t.string   "access_token_secret", limit: 255
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_foreign_key "followers", "accounts"
  add_foreign_key "friends", "accounts"
end
