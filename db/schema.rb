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

ActiveRecord::Schema.define(version: 20140614082248) do

  create_table "requests", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "tax_year"
    t.boolean  "is_single"
    t.boolean  "is_married"
    t.boolean  "is_widowed"
    t.boolean  "is_divorced"
    t.boolean  "is_seperated"
    t.boolean  "is_coupled"
    t.boolean  "is_same_sex_married"
    t.string   "spouse_name"
    t.date     "spouse_death_date"
    t.date     "birth_date"
    t.integer  "gender"
    t.integer  "occupation"
    t.date     "spouse_birth_date"
    t.integer  "spouse_gender"
    t.integer  "spouse_occupation"
    t.boolean  "retired"
    t.boolean  "spouse_retired"
    t.boolean  "immigrant"
    t.boolean  "spouse_immigrant"
    t.date     "immigration_date"
    t.date     "spouse_immigration_date"
    t.boolean  "idf_service"
    t.boolean  "spouse_idf_service"
    t.date     "idf_discharge_date"
    t.date     "spouse_idf_discharge_date"
    t.integer  "idf_service_duration"
    t.integer  "spouse_idf_service_duration"
    t.boolean  "academic"
    t.boolean  "spouse_academic"
    t.boolean  "special_area_resident"
    t.boolean  "spouse_special_area_resident"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "phone"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
