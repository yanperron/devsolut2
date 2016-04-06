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

ActiveRecord::Schema.define(version: 20160405131045) do


  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.string   "author_type"
    t.integer  "author_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree
  end

  create_table "agencies", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "address"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.integer  "user_id"
    t.string   "github_account"
    t.integer  "repos_public"
    t.integer  "total_stars"
    t.integer  "total_members"
    t.string   "photo"
    t.string   "linkedin_account"
    t.boolean  "does_web_development",    default: false, null: false
    t.boolean  "does_mobile_development", default: false, null: false
    t.index ["user_id"], name: "index_agencies_on_user_id", using: :btree
  end

  create_table "messages", force: :cascade do |t|
    t.integer  "user_id"
    t.text     "content"
    t.boolean  "read"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_messages_on_user_id", using: :btree
  end

  create_table "github_reports", force: :cascade do |t|
    t.integer  "agency_id"
    t.integer  "repos_public"
    t.integer  "total_stars"
    t.integer  "total_members"
    t.json     "languages"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["agency_id"], name: "index_github_reports_on_agency_id", using: :btree
  end

  create_table "linkedin_reports", force: :cascade do |t|
    t.integer  "agency_id"
    t.string   "size"
    t.string   "specialities"
    t.string   "industry"
    t.string   "address"
    t.string   "create_date"
    t.string   "website"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["agency_id"], name: "index_linkedin_reports_on_agency_id", using: :btree
  end

  create_table "quotes", force: :cascade do |t|
    t.text     "titre"
    t.text     "description"
    t.string   "pdf"
    t.integer  "agency_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "email"
    t.index ["agency_id"], name: "index_quotes_on_agency_id", using: :btree
  end

  create_table "references", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "agency_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "photo"
    t.index ["agency_id"], name: "index_references_on_agency_id", using: :btree
  end

  create_table "reviews", force: :cascade do |t|
    t.text     "description"
    t.integer  "agency_id"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "star"
    t.index ["agency_id"], name: "index_reviews_on_agency_id", using: :btree
    t.index ["user_id"], name: "index_reviews_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "photo"
    t.boolean  "admin"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "wishlists", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.integer  "agency_id"
    t.index ["agency_id"], name: "index_wishlists_on_agency_id", using: :btree
    t.index ["user_id"], name: "index_wishlists_on_user_id", using: :btree
  end

  add_foreign_key "agencies", "users"
  add_foreign_key "messages", "users"
  add_foreign_key "github_reports", "agencies"
  add_foreign_key "linkedin_reports", "agencies"
  add_foreign_key "quotes", "agencies"
  add_foreign_key "references", "agencies"
  add_foreign_key "reviews", "agencies"
  add_foreign_key "reviews", "users"
  add_foreign_key "wishlists", "agencies"
  add_foreign_key "wishlists", "users"
end
