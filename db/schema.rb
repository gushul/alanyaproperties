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

ActiveRecord::Schema.define(:version => 20130312201909) do

  create_table "about_pages", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.string   "url"
    t.string   "slug"
    t.boolean  "default"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "about_pages", ["slug"], :name => "index_about_pages_on_slug", :unique => true

  create_table "admins", :force => true do |t|
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
  end

  add_index "admins", ["email"], :name => "index_admins_on_email", :unique => true
  add_index "admins", ["reset_password_token"], :name => "index_admins_on_reset_password_token", :unique => true

  create_table "assets", :force => true do |t|
    t.string   "type"
    t.string   "asset"
    t.integer  "attachment_id"
    t.string   "attachment_type"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "assets", ["attachment_id", "attachment_type"], :name => "index_assets_on_attachment_id_and_attachment_type"

  create_table "cities", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.text     "description"
    t.string   "name_case"
    t.string   "url"
    t.string   "slug"
  end

  add_index "cities", ["slug"], :name => "index_cities_on_slug", :unique => true

  create_table "contact_messages", :force => true do |t|
    t.string   "contact_name"
    t.string   "contact_email"
    t.string   "contact_phone"
    t.text     "message"
    t.integer  "contact_topic_id"
    t.integer  "contact_person_id"
    t.integer  "property_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  add_index "contact_messages", ["contact_person_id"], :name => "index_contact_messages_on_contact_person_id"
  add_index "contact_messages", ["contact_topic_id"], :name => "index_contact_messages_on_contact_topic_id"
  add_index "contact_messages", ["property_id"], :name => "index_contact_messages_on_property_id"

  create_table "contact_people", :force => true do |t|
    t.string   "name"
    t.string   "post"
    t.string   "photo"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.boolean  "default",    :default => false
  end

  create_table "contact_topics", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "photos", :force => true do |t|
    t.string   "title"
    t.string   "alt"
    t.string   "picture"
    t.string   "gallery_id"
    t.string   "gallery_type"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "photos", ["gallery_id", "gallery_type"], :name => "index_photos_on_gallery_id_and_gallery_type"

  create_table "properties", :force => true do |t|
    t.string   "name"
    t.string   "oid"
    t.text     "description"
    t.string   "property_type"
    t.string   "property_kind"
    t.integer  "price"
    t.integer  "city_id"
    t.string   "photo"
    t.text     "geo"
    t.text     "property_attributes"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.integer  "total_area"
    t.string   "property_for"
    t.boolean  "hot"
    t.integer  "to_sea"
    t.date     "new_until"
  end

  add_index "properties", ["city_id"], :name => "index_properties_on_city_id"

  create_table "property_attributes", :force => true do |t|
    t.string   "name"
    t.string   "attribute_type"
    t.text     "options"
    t.string   "default"
    t.integer  "position",       :default => 0, :null => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "redactor_assets", :force => true do |t|
    t.string   "data_file_name",                  :null => false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    :limit => 30
    t.string   "type",              :limit => 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  add_index "redactor_assets", ["assetable_type", "assetable_id"], :name => "idx_redactor_assetable"
  add_index "redactor_assets", ["assetable_type", "type", "assetable_id"], :name => "idx_redactor_assetable_type"

  create_table "services", :force => true do |t|
    t.string   "name"
    t.text     "body"
    t.boolean  "is_main"
    t.string   "slug"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "settings", :force => true do |t|
    t.string   "key"
    t.text     "value"
    t.integer  "model_id"
    t.string   "model_type"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "type"
  end

  add_index "settings", ["type"], :name => "index_settings_on_type"

  create_table "sliders", :force => true do |t|
    t.string   "photo"
    t.string   "model_type"
    t.string   "model_id"
    t.text     "data"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "transfers", :force => true do |t|
    t.string   "transfer_type"
    t.string   "flight_number"
    t.string   "date_arrival"
    t.string   "time_arrival"
    t.integer  "terminal"
    t.string   "address"
    t.integer  "people"
    t.string   "contact_name"
    t.string   "contact_phone"
    t.string   "contact_email"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "turkey_news", :force => true do |t|
    t.string   "title"
    t.text     "teaser"
    t.text     "body"
    t.string   "slug"
    t.string   "photo"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
