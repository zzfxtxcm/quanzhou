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

ActiveRecord::Schema.define(version: 20140504063257) do

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"

  create_table "activities", force: true do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "opening_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "admin_users", force: true do |t|
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
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true

  create_table "albums", force: true do |t|
    t.string   "url"
    t.string   "name"
    t.integer  "new_home_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "albums", ["new_home_id"], name: "index_albums_on_new_home_id"

  create_table "apartments", force: true do |t|
    t.string   "name"
    t.string   "apartment_name"
    t.integer  "area"
    t.string   "apartment_thumb"
    t.integer  "new_home_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "area_ranges", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "areas", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "areas", ["name"], name: "index_areas_on_name"

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "ancestry"
  end

  add_index "categories", ["ancestry"], name: "index_categories_on_ancestry"

  create_table "characters", force: true do |t|
    t.string   "name"
    t.text     "content"
    t.string   "character_thumb"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
  end

  create_table "ckeditor_assets", force: true do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable"
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type"

  create_table "construction_categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "developers", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "developers", ["name"], name: "index_developers_on_name"

  create_table "group_buyings", force: true do |t|
    t.integer  "new_home_id"
    t.integer  "price"
    t.text     "explanation"
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "recommend"
  end

  create_table "information", force: true do |t|
    t.integer  "category_id"
    t.string   "title"
    t.string   "style"
    t.string   "information_thumb"
    t.string   "keywords"
    t.text     "description"
    t.text     "content"
    t.integer  "listorder"
    t.integer  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "source"
    t.integer  "new_home_id"
    t.integer  "information_type_id"
  end

  add_index "information", ["category_id", "title", "created_at"], name: "index_information_on_category_id_and_title_and_created_at"
  add_index "information", ["information_type_id"], name: "index_information_on_information_type_id"
  add_index "information", ["new_home_id"], name: "index_information_on_new_home_id"

  create_table "information_estate_openeds", force: true do |t|
    t.string   "title"
    t.integer  "new_home_id"
    t.datetime "opening_time"
    t.datetime "delivery_time"
    t.integer  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "information_estate_openeds", ["new_home_id"], name: "index_information_estate_openeds_on_new_home_id"

  create_table "information_sharings", force: true do |t|
    t.string   "title"
    t.string   "url"
    t.text     "content"
    t.string   "information_sharing_thumb"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "information_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "intention_to_registers", force: true do |t|
    t.string   "name"
    t.string   "qq"
    t.string   "tel"
    t.integer  "new_home_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "new_homes", force: true do |t|
    t.string   "name"
    t.integer  "price"
    t.string   "tel"
    t.string   "project_address"
    t.string   "sales_address"
    t.integer  "area_id"
    t.integer  "developers_id"
    t.string   "agents"
    t.string   "covers"
    t.string   "gfa"
    t.string   "pool_area"
    t.string   "parking"
    t.string   "number_users"
    t.string   "building_towers"
    t.string   "floors_case"
    t.string   "main_units"
    t.string   "house_area"
    t.string   "greening_rate"
    t.string   "volume_rate"
    t.string   "fit"
    t.string   "property"
    t.string   "school"
    t.string   "hospital"
    t.string   "bank"
    t.string   "shopping"
    t.string   "neighborhoods"
    t.string   "landscapes"
    t.string   "bus"
    t.string   "car"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "status_id"
    t.string   "new_home_thumb"
    t.integer  "section_id"
    t.integer  "property_type_id"
    t.integer  "construction_category_id"
    t.integer  "area_range_id"
    t.integer  "project_features_id"
    t.string   "map_address"
  end

  add_index "new_homes", ["area_range_id"], name: "index_new_homes_on_area_range_id"
  add_index "new_homes", ["construction_category_id"], name: "index_new_homes_on_construction_category_id"
  add_index "new_homes", ["name", "price", "area_id"], name: "index_new_homes_on_name_and_price_and_area_id"
  add_index "new_homes", ["project_features_id"], name: "index_new_homes_on_project_features_id"
  add_index "new_homes", ["property_type_id"], name: "index_new_homes_on_property_type_id"
  add_index "new_homes", ["section_id"], name: "index_new_homes_on_section_id"
  add_index "new_homes", ["status_id"], name: "index_new_homes_on_status_id"

  create_table "project_features", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "property_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sections", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "statuses", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
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
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
