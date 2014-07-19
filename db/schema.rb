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

ActiveRecord::Schema.define(version: 20140719090311) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "btl_forms", force: true do |t|
    t.integer  "income"
    t.integer  "tax"
    t.integer  "request_id"
    t.boolean  "spouse"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.string   "type"
  end

  create_table "form_106s", force: true do |t|
    t.integer  "field_158",         default: 0
    t.integer  "field_244",         default: 0
    t.integer  "field_248",         default: 0
    t.integer  "field_042",         default: 0
    t.integer  "field_045",         default: 0
    t.integer  "field_011",         default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "request_id"
    t.boolean  "spouse"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
  end

  create_table "form_857s", force: true do |t|
    t.integer  "income"
    t.integer  "tax"
    t.integer  "request_id"
    t.boolean  "spouse"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
  end

  create_table "form_867s", force: true do |t|
    t.integer  "field_076"
    t.integer  "field_078"
    t.integer  "field_126"
    t.integer  "field_055"
    t.integer  "field_167_053"
    t.integer  "field_209"
    t.integer  "field_043"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.integer  "pre_deduction_profit_0"
    t.integer  "pre_deduction_profit_10"
    t.integer  "pre_deduction_profit_20"
    t.integer  "pre_deduction_profit_25"
    t.integer  "pre_deduction_profit_30"
    t.integer  "pre_deduction_profit_35"
    t.integer  "deductable_losses"
    t.integer  "undeductable_losses"
    t.integer  "field_56_256"
    t.integer  "field_40"
    t.integer  "pre_deduction_dividend_0"
    t.integer  "pre_deduction_dividend_15"
    t.integer  "pre_deduction_dividend_20"
    t.integer  "pre_deduction_dividend_25"
    t.integer  "dividend_income_abroad_0"
    t.integer  "dividend_income_abroad_15"
    t.integer  "dividend_income_abroad_20"
    t.integer  "dividend_income_abroad_25"
    t.integer  "exempt_profit_0"
    t.integer  "exempt_profit_15"
    t.integer  "exempt_profit_20"
    t.integer  "exempt_profit_25"
    t.integer  "tax_abroad_0"
    t.integer  "tax_abroad_15"
    t.integer  "tax_abroad_20"
    t.integer  "tax_abroad_25"
    t.integer  "pre_deduction_interest_profit_0"
    t.integer  "pre_deduction_interest_profit_10"
    t.integer  "pre_deduction_interest_profit_15"
    t.integer  "pre_deduction_interest_profit_20"
    t.integer  "pre_deduction_interest_profit_25"
    t.integer  "pre_deduction_interest_profit_35"
    t.integer  "interest_profit_abroad_0"
    t.integer  "interest_profit_abroad_10"
    t.integer  "interest_profit_abroad_15"
    t.integer  "interest_profit_abroad_20"
    t.integer  "interest_profit_abroad_25"
    t.integer  "interest_profit_abroad_35"
    t.integer  "interest_exempt_profit_0"
    t.integer  "interest_exempt_profit_10"
    t.integer  "interest_exempt_profit_15"
    t.integer  "interest_exempt_profit_20"
    t.integer  "interest_exempt_profit_25"
    t.integer  "interest_exempt_profit_35"
    t.integer  "dividend_tax"
    t.integer  "interest_tax"
    t.integer  "request_id"
  end

  create_table "kids", force: true do |t|
    t.string  "name"
    t.date    "date_of_birth"
    t.integer "request_id"
    t.boolean "under_my_supervision"
    t.boolean "single_parent"
    t.boolean "supported"
  end

  create_table "pension_forms", force: true do |t|
    t.integer  "income"
    t.integer  "tax"
    t.boolean  "spouse"
    t.integer  "request_id"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
  end

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
    t.date     "academia_graduation_date"
    t.date     "spouse_academia_graduation_date"
    t.integer  "academia_institution"
    t.integer  "spouse_academia_institution"
    t.integer  "academia_degree"
    t.integer  "spouse_academia_degree"
    t.integer  "academia_years"
    t.integer  "spouse_academia_years"
    t.boolean  "lived_with_spouse_throughout"
    t.date     "special_area_residency_start_date"
    t.date     "special_area_residency_end_date"
    t.integer  "city"
    t.boolean  "blind"
    t.boolean  "disabled"
    t.boolean  "spouse_blind"
    t.boolean  "spouse_disabled"
    t.boolean  "israeli_resident"
    t.string   "spouse_israeli_resident"
    t.boolean  "paying_alimony"
    t.boolean  "employed"
    t.boolean  "spouse_employed"
    t.boolean  "author"
    t.boolean  "spouse_author"
    t.boolean  "stock"
    t.boolean  "spouse_stock"
    t.boolean  "lottery"
    t.boolean  "spouse_lottery"
    t.boolean  "pension"
    t.boolean  "spouse_pension"
    t.boolean  "other"
    t.boolean  "spouse_other"
    t.boolean  "btl"
    t.boolean  "spouse_btl"
    t.string   "profession"
    t.string   "spouse_profession"
    t.integer  "income_abroad_interest"
    t.integer  "income_abroad_dividend"
    t.integer  "income_abroad_capital_profit"
    t.integer  "income_abroad_capital_loss"
    t.integer  "income_abroad_tax"
    t.boolean  "appartment"
    t.boolean  "spouse_appartment"
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

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
