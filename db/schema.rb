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

ActiveRecord::Schema.define(version: 20170319231143) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attempts", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "drill_id"
    t.boolean  "success",          default: false
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "group_session_id"
    t.text     "body"
    t.index ["drill_id"], name: "index_attempts_on_drill_id", using: :btree
    t.index ["group_session_id"], name: "index_attempts_on_group_session_id", using: :btree
    t.index ["user_id"], name: "index_attempts_on_user_id", using: :btree
  end

  create_table "drill_groups", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "level"
    t.integer  "points"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "drills", force: :cascade do |t|
    t.text     "description"
    t.integer  "drill_group_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["drill_group_id"], name: "index_drills_on_drill_group_id", using: :btree
  end

  create_table "favourites", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "drill_group_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["drill_group_id"], name: "index_favourites_on_drill_group_id", using: :btree
    t.index ["user_id"], name: "index_favourites_on_user_id", using: :btree
  end

  create_table "group_sessions", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "drill_group_id"
    t.integer  "points",         default: 0
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["drill_group_id"], name: "index_group_sessions_on_drill_group_id", using: :btree
    t.index ["user_id"], name: "index_group_sessions_on_user_id", using: :btree
  end

  create_table "solutions", force: :cascade do |t|
    t.text     "body"
    t.integer  "drill_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["drill_id"], name: "index_solutions_on_drill_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "photo"
    t.integer  "points",          default: 0
    t.integer  "donuts",          default: 0
    t.boolean  "is_admin",        default: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.boolean  "is_approved",     default: false
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
  end

  add_foreign_key "attempts", "drills"
  add_foreign_key "attempts", "group_sessions"
  add_foreign_key "attempts", "users"
  add_foreign_key "drills", "drill_groups"
  add_foreign_key "favourites", "drill_groups"
  add_foreign_key "favourites", "users"
  add_foreign_key "group_sessions", "drill_groups"
  add_foreign_key "group_sessions", "users"
  add_foreign_key "solutions", "drills"
end
