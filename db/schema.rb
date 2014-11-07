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

ActiveRecord::Schema.define(:version => 20101010033938) do

  create_table "autocategories", :force => true do |t|
    t.string   "category"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "automodels", :force => true do |t|
    t.string   "make"
    t.string   "model"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "favorites", :force => true do |t|
    t.integer  "user_id"
    t.integer  "listing_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "listings", :force => true do |t|
    t.integer  "year"
    t.string   "make"
    t.string   "model"
    t.integer  "price"
    t.string   "active"
    t.integer  "user_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.string   "listingtype"
    t.string   "vin"
    t.string   "body"
    t.string   "transmission"
    t.string   "engine"
    t.string   "exterior_color"
    t.string   "interior_color"
    t.integer  "mileage"
    t.string   "drive"
    t.integer  "doors"
    t.string   "fuel"
    t.text     "desc"
    t.string   "category"
    t.string   "subcategory"
    t.string   "length"
    t.string   "hull"
    t.boolean  "featured"
    t.datetime "expired_at"
  end

  create_table "marinecategories", :force => true do |t|
    t.string   "category"
    t.string   "subcategory"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "marinemakes", :force => true do |t|
    t.string   "make"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "messages", :force => true do |t|
    t.integer  "sender_id"
    t.integer  "recipient_id"
    t.integer  "listing_id"
    t.string   "subject"
    t.text     "body"
    t.datetime "read_at"
    t.datetime "sender_deleted_at"
    t.datetime "recipient_deleted_at"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.string   "name"
    t.string   "email"
    t.string   "phone"
  end

  create_table "motocategories", :force => true do |t|
    t.string   "category"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "motomakes", :force => true do |t|
    t.string   "make"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "sort_order"
  end

  create_table "photos", :force => true do |t|
    t.string   "name"
    t.string   "image_file"
    t.string   "image_filename"
    t.integer  "image_width"
    t.integer  "image_height"
    t.integer  "listing_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "powercategories", :force => true do |t|
    t.string   "category"
    t.string   "subcategory"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "powermakes", :force => true do |t|
    t.string   "make"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "sort_order"
  end

  create_table "user_sessions", :force => true do |t|
    t.string   "username"
    t.string   "password"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.string   "firstname"
    t.string   "lastname"
    t.string   "phone"
    t.string   "address"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "referred_by"
    t.string   "perishable_token",   :default => "", :null => false
    t.integer  "login_count"
    t.integer  "failed_login_count"
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.boolean  "admin"
  end

  add_index "users", ["email"], :name => "index_users_on_email"
  add_index "users", ["perishable_token"], :name => "index_users_on_perishable_token"

  create_table "wishlists", :force => true do |t|
    t.string   "listingtype"
    t.string   "year"
    t.string   "make"
    t.string   "model"
    t.string   "category"
    t.string   "subcategory"
    t.integer  "user_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "body"
    t.string   "min_year"
    t.string   "max_year"
    t.string   "min_price"
    t.string   "max_price"
  end

end
