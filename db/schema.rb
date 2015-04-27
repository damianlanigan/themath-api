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

ActiveRecord::Schema.define(version: 20150427195216) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "journal_categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "journal_entries", force: :cascade do |t|
    t.integer  "score"
    t.text     "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.point    "location"
    t.datetime "timestamp"
  end

  add_index "journal_entries", ["user_id"], name: "index_journal_entries_on_user_id", using: :btree

  create_table "journal_entries_categories", id: false, force: :cascade do |t|
    t.integer  "journal_entry_id"
    t.integer  "journal_category_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "id"
  end

  add_index "journal_entries_categories", ["id"], name: "index_journal_entries_categories_on_id", unique: true, using: :btree
  add_index "journal_entries_categories", ["journal_category_id", "journal_entry_id"], name: "entry_category", unique: true, using: :btree
  add_index "journal_entries_categories", ["journal_category_id"], name: "index_journal_entries_categories_on_journal_category_id", using: :btree

  create_table "oauth_access_grants", force: :cascade do |t|
    t.integer  "resource_owner_id", null: false
    t.integer  "application_id",    null: false
    t.string   "token",             null: false
    t.integer  "expires_in",        null: false
    t.text     "redirect_uri",      null: false
    t.datetime "created_at",        null: false
    t.datetime "revoked_at"
    t.string   "scopes"
  end

  add_index "oauth_access_grants", ["token"], name: "index_oauth_access_grants_on_token", unique: true, using: :btree

  create_table "oauth_access_tokens", force: :cascade do |t|
    t.integer  "resource_owner_id"
    t.integer  "application_id"
    t.string   "token",             null: false
    t.string   "refresh_token"
    t.integer  "expires_in"
    t.datetime "revoked_at"
    t.datetime "created_at",        null: false
    t.string   "scopes"
  end

  add_index "oauth_access_tokens", ["refresh_token"], name: "index_oauth_access_tokens_on_refresh_token", unique: true, using: :btree
  add_index "oauth_access_tokens", ["resource_owner_id"], name: "index_oauth_access_tokens_on_resource_owner_id", using: :btree
  add_index "oauth_access_tokens", ["token"], name: "index_oauth_access_tokens_on_token", unique: true, using: :btree

  create_table "oauth_applications", force: :cascade do |t|
    t.string   "name",                      null: false
    t.string   "uid",                       null: false
    t.string   "secret",                    null: false
    t.text     "redirect_uri",              null: false
    t.string   "scopes",       default: "", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "oauth_applications", ["uid"], name: "index_oauth_applications_on_uid", unique: true, using: :btree

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

  add_foreign_key "journal_entries", "users"
end
