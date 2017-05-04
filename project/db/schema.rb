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

ActiveRecord::Schema.define(version: 20170405022656) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
#This creates a new group in the database with the appropriate attributes
  create_table "groups", force: :cascade do |t|
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "name",                limit: 100
    t.string   "interest",            limit: 100
    t.string   "language_preference", limit: 100
    t.string   "availability",        limit: 100
    t.string   "member_1",            limit: 45
    t.string   "member_2",            limit: 45
    t.string   "member_3",            limit: 45
    t.string   "member_4",            limit: 45
    t.string   "member_5",            limit: 45
  end
#This creates a new group in the database with the appropriate attributes
  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "interest"
    t.string   "language1"
    t.string   "language2"
    t.string   "time1"
    t.string   "time2"
    t.string   "skill"
    t.string   "password"
    t.integer  "groupid"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "group_id"
    t.integer  "groups_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "password_digest"
  end

  add_index "users", ["groups_id"], name: "index_users_on_groups_id", using: :btree

  add_foreign_key "users", "groups"
end
