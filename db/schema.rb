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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130420112254) do

  create_table "bednets_and_illinesses", :force => true do |t|
    t.string   "county"
    t.float    "under_net"
    t.float    "fever_or_malaria"
    t.string   "latitude"
    t.string   "longitude"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "diseases", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "patient_id"
  end

  add_index "diseases", ["patient_id"], :name => "index_diseases_on_patient_id"

  create_table "health_facilities", :force => true do |t|
    t.string   "name"
    t.string   "hmis"
    t.string   "province"
    t.string   "district"
    t.string   "division"
    t.string   "location"
    t.string   "sub_location"
    t.string   "srm"
    t.string   "facility_type"
    t.string   "agency"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "user_id"
    t.string   "source"
    t.string   "address"
  end

  add_index "health_facilities", ["user_id"], :name => "index_health_facilities_on_user_id"

  create_table "medicines", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "patients", :force => true do |t|
    t.string   "names"
    t.string   "identification_number"
    t.string   "gender"
    t.string   "address"
    t.string   "town"
    t.string   "location"
    t.string   "phone"
    t.string   "country"
    t.string   "occupation"
    t.string   "civil_status"
    t.date     "date_of_birth"
    t.integer  "health_facility_id"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  add_index "patients", ["health_facility_id"], :name => "index_patients_on_health_facility_id"

  create_table "prescription_diseases", :force => true do |t|
    t.integer  "prescription_id"
    t.integer  "disease_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "prescription_diseases", ["disease_id"], :name => "index_prescription_diseases_on_disease_id"
  add_index "prescription_diseases", ["prescription_id"], :name => "index_prescription_diseases_on_prescription_id"

  create_table "prescription_lines", :force => true do |t|
    t.string   "quantity"
    t.integer  "frequency"
    t.string   "time"
    t.integer  "period_no"
    t.string   "period"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "prescriptions", :force => true do |t|
    t.integer  "patient_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "name"
    t.text     "notes"
  end

  add_index "prescriptions", ["patient_id"], :name => "index_prescriptions_on_patient_id"

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "roles", ["name", "resource_type", "resource_id"], :name => "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], :name => "index_roles_on_name"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "name"
    t.string   "authentication_token"
  end

  add_index "users", ["authentication_token"], :name => "index_users_on_authentication_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "users_roles", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], :name => "index_users_roles_on_user_id_and_role_id"

end
