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

ActiveRecord::Schema.define(version: 20150119212407) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "users", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                                      default: "",                           null: false
    t.string   "password_digest",                            default: "",                           null: false
    t.string   "username",                        limit: 64
    t.string   "time_zone",                                  default: "Eastern Time (US & Canada)"
    t.string   "first_name"
    t.string   "last_name"
    t.text     "bio"
    t.string   "website"
    t.string   "phone_number"
    t.string   "otp_secret_key"
    t.integer  "sign_in_count",                              default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "original_source"
    t.string   "session_source"
    t.datetime "first_visit_at"
    t.datetime "last_visit_at"
    t.string   "reset_password_token"
    t.datetime "reset_password_token_created_at"
    t.string   "remember_token"
    t.datetime "remember_token_created_at"
    t.string   "confirmation_email"
    t.string   "confirmation_token"
    t.string   "confirmation_token_created_at"
    t.integer  "failed_attempts",                            default: 0
    t.datetime "locked_at"
    t.string   "unlock_token"
    t.datetime "unlock_token_created_at"
    t.datetime "suspended_at"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
