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

ActiveRecord::Schema.define(version: 20170303011104) do

  create_table "issues", force: :cascade do |t|
    t.string   "title"
    t.string   "desc1"
    t.string   "desc2"
    t.string   "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "options", force: :cascade do |t|
    t.text     "option"
    t.integer  "issue_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["issue_id", "created_at"], name: "index_options_on_issue_id_and_created_at"
    t.index ["issue_id"], name: "index_options_on_issue_id"
  end

  create_table "results", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "issue_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "option_id"
    t.index ["issue_id"], name: "index_results_on_issue_id"
    t.index ["user_id", "issue_id"], name: "index_results_on_user_id_and_issue_id", unique: true
    t.index ["user_id"], name: "index_results_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "password_digest"
    t.boolean  "admin",           default: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.index ["username"], name: "index_users_on_username", unique: true
  end

end
