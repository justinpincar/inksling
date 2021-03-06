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

ActiveRecord::Schema.define(:version => 20110925170442) do

  create_table "authors", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "alias"
    t.text     "autobiography"
    t.string   "slug"
  end

  add_index "authors", ["email"], :name => "index_authors_on_email", :unique => true
  add_index "authors", ["reset_password_token"], :name => "index_authors_on_reset_password_token", :unique => true
  add_index "authors", ["slug"], :name => "index_authors_on_slug", :unique => true

  create_table "comments", :force => true do |t|
    t.text     "text"
    t.integer  "author_id"
    t.integer  "ink_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["ink_id"], :name => "index_comments_on_ink_id"

  create_table "followings", :force => true do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "followings", ["followed_id"], :name => "index_followings_on_followed_id"

  create_table "friendly_id_slugs", :force => true do |t|
    t.string   "slug",                         :null => false
    t.integer  "sluggable_id",                 :null => false
    t.string   "sluggable_type", :limit => 40
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type"], :name => "index_friendly_id_slugs_on_slug_and_sluggable_type", :unique => true
  add_index "friendly_id_slugs", ["sluggable_id"], :name => "index_friendly_id_slugs_on_sluggable_id"
  add_index "friendly_id_slugs", ["sluggable_type"], :name => "index_friendly_id_slugs_on_sluggable_type"

  create_table "ink_tags", :force => true do |t|
    t.integer  "ink_id"
    t.integer  "tag_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ink_tags", ["ink_id", "tag_id"], :name => "index_ink_tags_on_ink_id_and_tag_id", :unique => true
  add_index "ink_tags", ["ink_id"], :name => "index_ink_tags_on_ink_id"
  add_index "ink_tags", ["tag_id"], :name => "index_ink_tags_on_tag_id"

  create_table "inks", :force => true do |t|
    t.string   "title"
    t.text     "text"
    t.integer  "author_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "category"
    t.string   "slug"
  end

  add_index "inks", ["slug"], :name => "index_inks_on_slug", :unique => true

  create_table "tags", :force => true do |t|
    t.string   "text"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
  end

  add_index "tags", ["slug"], :name => "index_tags_on_slug", :unique => true

end
