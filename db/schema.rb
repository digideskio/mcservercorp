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

ActiveRecord::Schema.define(:version => 20110516043703) do

  create_table "comments", :force => true do |t|
    t.string   "author"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.boolean  "has_been_edited"
    t.integer  "parent_id"
    t.string   "parent_type"
    t.integer  "numberofcomments"
  end

  add_index "comments", ["parent_id", "parent_type"], :name => "index_comments_on_parent_id_and_parent_type"

  create_table "servers", :force => true do |t|
    t.string   "name"
    t.string   "url"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "ip_address"
    t.string   "location"
    t.string   "game_mode"
    t.string   "whitelist_url"
    t.string   "mc_address"
    t.integer  "port"
    t.boolean  "status"
    t.boolean  "whitelisted"
    t.integer  "users_id"
    t.integer  "numberofcomments"
    t.integer  "votecount"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "username"
    t.text     "bio"
    t.integer  "age"
    t.integer  "comments"
    t.integer  "servers"
    t.integer  "votes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "location"
    t.string   "mc_username"
    t.string   "website"
    t.integer  "server_count"
    t.integer  "comment_count"
    t.date     "birthday"
    t.integer  "server_id"
    t.integer  "votecount"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "votes", :force => true do |t|
    t.integer "votable_id"
    t.string  "votable_type"
    t.integer "user_id"
  end

end
