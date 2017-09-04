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

ActiveRecord::Schema.define(version: 20170902145330) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "personal_references", force: :cascade do |t|
    t.string   "first_name"
    t.string   "second_name"
    t.string   "first_last_name"
    t.string   "second_last_name"
    t.bigint   "cell_phone_number"
    t.integer  "requisition_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["requisition_id"], name: "index_personal_references_on_requisition_id", using: :btree
  end

  create_table "profiles", force: :cascade do |t|
    t.string   "first_name",       null: false
    t.string   "second_name"
    t.string   "second_last_name"
    t.string   "first_last_name",  null: false
    t.date     "birth_date",       null: false
    t.string   "curp",             null: false
    t.string   "rfc",              null: false
    t.string   "gender"
    t.string   "birth_state"
    t.bigint   "phone_number",     null: false
    t.integer  "user_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["user_id"], name: "index_profiles_on_user_id", using: :btree
  end

  create_table "requisitions", force: :cascade do |t|
    t.decimal  "income",               precision: 10, scale: 2
    t.bigint   "address_years"
    t.bigint   "company_years"
    t.string   "marital_status"
    t.decimal  "requested_amount",     precision: 10, scale: 2
    t.string   "payment_terms"
    t.string   "bank"
    t.string   "comment"
    t.string   "company_name"
    t.bigint   "company_phone_number"
    t.bigint   "dependents_number"
    t.string   "company_position"
    t.boolean  "has_sgmm"
    t.boolean  "has_imss"
    t.boolean  "has_car"
    t.integer  "profile_id"
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.index ["profile_id"], name: "index_requisitions_on_profile_id", using: :btree
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
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.text     "image"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "personal_references", "requisitions"
  add_foreign_key "profiles", "users"
  add_foreign_key "requisitions", "profiles"
end
