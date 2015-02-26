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

ActiveRecord::Schema.define(version: 20150226112341) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "reports", force: :cascade do |t|
    t.json     "development",                            default: []
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
    t.json     "smart",                                  default: []
    t.datetime "approved_at"
    t.json     "mid_year_review_smart",                  default: []
    t.json     "mid_year_review_development",            default: []
    t.text     "mid_year_review_comment"
    t.datetime "mid_year_approved_at"
    t.json     "end_year_review_smart",                  default: []
    t.json     "end_year_review_development",            default: []
    t.text     "end_year_review_comment"
    t.text     "approved_comment"
    t.json     "approved_snapshot_development"
    t.json     "approved_snapshot_smart"
    t.text     "mid_year_approved_comment"
    t.json     "mid_year_approved_snapshot_development"
    t.json     "mid_year_approved_snapshot_smart"
    t.datetime "end_year_approved_at"
    t.text     "end_year_approved_comment"
    t.json     "end_year_approved_snapshot_development"
    t.json     "end_year_approved_snapshot_smart"
    t.integer  "user_id"
    t.string   "type"
    t.json     "agreement"
    t.json     "approved_snapshot_agreement"
    t.json     "mid_year_approved_snapshot_agreement"
    t.json     "end_year_approved_snapshot_agreement"
  end

  add_index "reports", ["user_id"], name: "index_reports_on_user_id", using: :btree

  create_table "tokens", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.string   "value",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.text     "name"
    t.text     "email"
    t.text     "job_title"
    t.integer  "manager_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "staff_number"
    t.string   "grade"
    t.string   "organisation"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["manager_id"], name: "index_users_on_manager_id", using: :btree

  add_foreign_key "reports", "users"
end
