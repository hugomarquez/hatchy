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

ActiveRecord::Schema.define(version: 20160111181655) do

  create_table "hatchy_announcements", force: true do |t|
    t.text     "message",    limit: 80, null: false
    t.datetime "starts_at",             null: false
    t.datetime "ends_at",               null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hatchy_bank_accounts", force: true do |t|
    t.integer  "user_id"
    t.integer  "bank_id"
    t.string   "account",       null: false
    t.string   "account_digit", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "hatchy_bank_accounts", ["user_id", "bank_id"], name: "index_hatchy_bank_accounts_on_user_id_and_bank_id"

  create_table "hatchy_banks", force: true do |t|
    t.string   "name",       limit: 80, null: false
    t.string   "code",       limit: 10, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "hatchy_banks", ["code"], name: "index_hatchy_banks_on_code", unique: true

  create_table "hatchy_categories", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "hatchy_categories", ["name"], name: "index_hatchy_categories_on_name", unique: true

  create_table "hatchy_category_followers", force: true do |t|
    t.integer  "category_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "hatchy_category_followers", ["user_id", "category_id"], name: "index_hatchy_category_followers_on_user_id_and_category_id"

  create_table "hatchy_contributions", force: true do |t|
    t.integer  "project_id"
    t.integer  "user_id"
    t.integer  "reward_id"
    t.integer  "country_id"
    t.decimal  "value",                                null: false
    t.string   "status",                               null: false
    t.string   "name",                                 null: false
    t.string   "email",                                null: false
    t.string   "document",                             null: false
    t.string   "address_street",                       null: false
    t.string   "address_number",                       null: false
    t.string   "address_city",                         null: false
    t.string   "address_zip",                          null: false
    t.string   "address_state",                        null: false
    t.string   "address_phone",                        null: false
    t.string   "ip_address"
    t.string   "card_type",                            null: false
    t.date     "card_expires_on",                      null: false
    t.boolean  "anonymous",            default: false
    t.boolean  "notified_when_finish"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "hatchy_contributions", ["country_id"], name: "index_hatchy_contributions_on_country_id"
  add_index "hatchy_contributions", ["project_id"], name: "index_hatchy_contributions_on_project_id"
  add_index "hatchy_contributions", ["reward_id"], name: "index_hatchy_contributions_on_reward_id"
  add_index "hatchy_contributions", ["user_id"], name: "index_hatchy_contributions_on_user_id"

  create_table "hatchy_countries", force: true do |t|
    t.string   "name"
    t.string   "code2"
    t.string   "code3"
    t.string   "continent"
    t.string   "tld"
    t.string   "currency"
    t.boolean  "eu_member",  default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hatchy_project_accounts", force: true do |t|
    t.integer  "project_id"
    t.integer  "bank_id"
    t.string   "account_type"
    t.string   "email"
    t.string   "phone"
    t.string   "account"
    t.string   "account_digit"
    t.string   "owner_name"
    t.string   "owner_document"
    t.string   "address_street"
    t.string   "address_number"
    t.string   "address_city"
    t.string   "address_state"
    t.string   "address_zip"
    t.datetime "send_to_draft_at"
    t.datetime "send_to_analysis_at"
    t.datetime "send_to_rejected_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "hatchy_project_accounts", ["bank_id"], name: "index_hatchy_project_accounts_on_bank_id"
  add_index "hatchy_project_accounts", ["project_id"], name: "index_hatchy_project_accounts_on_project_id"

  create_table "hatchy_projects", force: true do |t|
    t.integer  "user_id"
    t.integer  "category_id"
    t.string   "project_img"
    t.string   "city"
    t.string   "name",                                                     null: false
    t.string   "headline"
    t.string   "about"
    t.string   "budget"
    t.string   "video_url"
    t.string   "short_url"
    t.decimal  "goal",             precision: 8, scale: 2
    t.integer  "online_days"
    t.datetime "online_date"
    t.datetime "expires_at"
    t.datetime "rejected_at"
    t.datetime "send_to_draft_at"
    t.string   "status",                                                   null: false
    t.boolean  "recommended",                              default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "hatchy_projects", ["category_id"], name: "index_hatchy_projects_on_category_id"
  add_index "hatchy_projects", ["user_id"], name: "index_hatchy_projects_on_user_id"

  create_table "hatchy_rewards", force: true do |t|
    t.integer  "project_id"
    t.decimal  "min_value",         null: false
    t.integer  "max_contributions"
    t.string   "description",       null: false
    t.integer  "row_order"
    t.datetime "deliver_at",        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "hatchy_rewards", ["project_id"], name: "index_hatchy_rewards_on_project_id"

  create_table "hatchy_users", force: true do |t|
    t.integer  "country_id"
    t.string   "profile_img"
    t.string   "cover_img"
    t.string   "facebook_link"
    t.string   "twitter_link"
    t.string   "other_link"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "about"
    t.boolean  "newsletter",             default: true,  null: false
    t.boolean  "subs_projects",          default: true,  null: false
    t.string   "locale",                 default: "en",  null: false
    t.string   "address_street"
    t.string   "address_number"
    t.string   "address_city"
    t.string   "address_state"
    t.string   "address_zip"
    t.string   "document"
    t.string   "phone"
    t.string   "mobile"
    t.boolean  "admin",                  default: false, null: false
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "hatchy_users", ["country_id"], name: "index_hatchy_users_on_country_id"
  add_index "hatchy_users", ["email"], name: "index_hatchy_users_on_email", unique: true
  add_index "hatchy_users", ["reset_password_token"], name: "index_hatchy_users_on_reset_password_token", unique: true

end
