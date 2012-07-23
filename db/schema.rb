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

ActiveRecord::Schema.define(:version => 20120723224759) do

  create_table "admin_users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "hashed_password"
    t.string   "salt"
    t.integer  "organization_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "admin_users", ["organization_id"], :name => "index_admin_users_on_organization_id"

  create_table "allergies", :force => true do |t|
    t.string   "title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "child_allergies", :force => true do |t|
    t.integer  "child_id"
    t.integer  "allergy_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "child_allergies", ["allergy_id"], :name => "index_child_allergies_on_allergy_id"
  add_index "child_allergies", ["child_id"], :name => "index_child_allergies_on_child_id"

  create_table "child_registrations", :force => true do |t|
    t.integer  "child_id"
    t.integer  "event_id"
    t.integer  "classroom_id"
    t.boolean  "is_active"
    t.integer  "user_transaction_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  add_index "child_registrations", ["child_id"], :name => "index_child_registrations_on_child_id"
  add_index "child_registrations", ["classroom_id"], :name => "index_child_registrations_on_classroom_id"
  add_index "child_registrations", ["event_id"], :name => "index_child_registrations_on_event_id"
  add_index "child_registrations", ["user_transaction_id"], :name => "index_child_registrations_on_user_transaction_id"

  create_table "children", :force => true do |t|
    t.integer  "user_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "gender"
    t.integer  "grade_completed"
    t.date     "dob"
    t.text     "special_needs"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "children", ["user_id"], :name => "index_children_on_user_id"

  create_table "churches", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "street_address"
    t.string   "city"
    t.string   "state"
    t.string   "postal_code"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "classrooms", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "organization_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "classrooms", ["organization_id"], :name => "index_classrooms_on_organization_id"

  create_table "events", :force => true do |t|
    t.integer  "organization_id"
    t.string   "title"
    t.text     "description"
    t.datetime "start_date_time"
    t.datetime "end_date_time"
    t.integer  "maximum_registrations"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  add_index "events", ["organization_id"], :name => "index_events_on_organization_id"

  create_table "organization_domains", :force => true do |t|
    t.integer  "organization_id"
    t.string   "domain_name"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "organization_domains", ["organization_id"], :name => "index_organization_domains_on_organization_id"

  create_table "organization_payment_details", :force => true do |t|
    t.integer  "organization_id"
    t.string   "payment_type"
    t.string   "hashed_cc_number"
    t.string   "salt"
    t.string   "cvv"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "organization_payment_details", ["organization_id"], :name => "index_organization_payment_details_on_organization_id"

  create_table "organization_payment_gateways", :force => true do |t|
    t.integer  "organization_id"
    t.integer  "payment_gateway_type_id"
    t.boolean  "is_test_mode"
    t.boolean  "is_active"
    t.string   "login"
    t.string   "user"
    t.string   "hashed_password"
    t.string   "salt"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  add_index "organization_payment_gateways", ["organization_id"], :name => "index_organization_payment_gateways_on_organization_id"
  add_index "organization_payment_gateways", ["payment_gateway_type_id"], :name => "index_organization_payment_gateways_on_payment_gateway_type_id"

  create_table "organization_subscriptions", :force => true do |t|
    t.integer  "organization_id"
    t.integer  "subscription_type_id"
    t.date     "start_date"
    t.date     "end_date"
    t.boolean  "is_auto_renew"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  add_index "organization_subscriptions", ["organization_id"], :name => "index_organization_subscriptions_on_organization_id"
  add_index "organization_subscriptions", ["subscription_type_id"], :name => "index_organization_subscriptions_on_subscription_type_id"

  create_table "organization_transactions", :force => true do |t|
    t.integer  "organization_id"
    t.integer  "organization_payment_detail_id"
    t.decimal  "amount"
    t.integer  "transaction_type_id"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  add_index "organization_transactions", ["organization_id"], :name => "index_organization_transactions_on_organization_id"
  add_index "organization_transactions", ["organization_payment_detail_id"], :name => "by_payment_detail", :unique => true

  create_table "organizations", :force => true do |t|
    t.string   "title"
    t.string   "contact_phone"
    t.string   "contact_email"
    t.text     "description"
    t.string   "subdomain"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "payment_gateway_types", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "requires"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "subscription_types", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.decimal  "price"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "transaction_types", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "user_payment_details", :force => true do |t|
    t.integer  "user_id"
    t.string   "payment_type"
    t.string   "hashed_cc_number"
    t.string   "salt"
    t.string   "cvv"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "user_payment_details", ["user_id"], :name => "index_user_payment_details_on_user_id"

  create_table "user_transactions", :force => true do |t|
    t.integer  "user_id"
    t.integer  "user_payment_detail_id"
    t.decimal  "amount"
    t.integer  "transaction_type_id"
    t.integer  "event_id"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
  end

  add_index "user_transactions", ["event_id"], :name => "index_user_transactions_on_event_id"
  add_index "user_transactions", ["transaction_type_id"], :name => "index_user_transactions_on_transaction_type_id"
  add_index "user_transactions", ["user_id"], :name => "index_user_transactions_on_user_id"
  add_index "user_transactions", ["user_payment_detail_id"], :name => "index_user_transactions_on_user_payment_detail_id"

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "hashed_password"
    t.string   "salt"
    t.integer  "organization_id"
    t.string   "home_phone"
    t.string   "mobile_phone"
    t.string   "street_address"
    t.string   "city"
    t.string   "state"
    t.string   "postal_code"
    t.integer  "church_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "users", ["organization_id"], :name => "index_users_on_organization_id"

  create_table "volunteer_registrations", :force => true do |t|
    t.integer  "event_id"
    t.integer  "volunteer_id"
    t.integer  "classroom_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "volunteer_registrations", ["classroom_id"], :name => "index_volunteer_registrations_on_classroom_id"
  add_index "volunteer_registrations", ["event_id"], :name => "index_volunteer_registrations_on_event_id"
  add_index "volunteer_registrations", ["volunteer_id"], :name => "index_volunteer_registrations_on_volunteer_id"

  create_table "volunteers", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone"
    t.integer  "organization_id"
    t.string   "hashed_password"
    t.string   "salt"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "volunteers", ["organization_id"], :name => "index_volunteers_on_organization_id"

end
