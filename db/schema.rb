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

ActiveRecord::Schema.define(:version => 20120608161217) do

  create_table "chapters", :force => true do |t|
    t.integer  "user_id"
    t.integer  "group_id"
    t.string   "title",        :limit => 300
    t.string   "summary",      :limit => 500
    t.integer  "scenes_count"
    t.integer  "position"
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
  end

  add_index "chapters", ["group_id"], :name => "index_chapters_on_group_id"
  add_index "chapters", ["user_id"], :name => "index_chapters_on_user_id"

  create_table "contents", :force => true do |t|
    t.string   "type",         :limit => 50
    t.integer  "user_id"
    t.integer  "group_id"
    t.string   "title",        :limit => 300
    t.string   "author",       :limit => 100
    t.string   "publisher",    :limit => 100
    t.text     "content"
    t.string   "content_type", :limit => 30
    t.string   "settings",     :limit => 500
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
  end

  add_index "contents", ["group_id"], :name => "index_contents_on_group_id"
  add_index "contents", ["type"], :name => "index_contents_on_type"
  add_index "contents", ["user_id"], :name => "index_contents_on_user_id"

  create_table "groups", :force => true do |t|
    t.integer  "user_id"
    t.string   "name",         :limit => 200
    t.string   "description",  :limit => 600
    t.string   "subdomain",    :limit => 100
    t.string   "banner_image"
    t.string   "settings",     :limit => 500
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
  end

  add_index "groups", ["user_id"], :name => "index_groups_on_user_id"

  create_table "participants", :force => true do |t|
    t.integer  "user_id"
    t.integer  "group_id"
    t.integer  "scene_id"
    t.integer  "chapter_id"
    t.datetime "created_at"
  end

  add_index "participants", ["scene_id"], :name => "index_participants_on_scene_id"

  create_table "scenes", :force => true do |t|
    t.integer  "user_id"
    t.integer  "group_id"
    t.integer  "chapter_id"
    t.text     "content"
    t.string   "content_type",       :limit => 30
    t.integer  "participants_count"
    t.integer  "position"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

  add_index "scenes", ["chapter_id"], :name => "index_scenes_on_chapter_id"
  add_index "scenes", ["group_id"], :name => "index_scenes_on_group_id"
  add_index "scenes", ["user_id"], :name => "index_scenes_on_user_id"

  create_table "seeds", :force => true do |t|
    t.integer  "group_id"
    t.integer  "user_id"
    t.string   "body",       :limit => 500
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "seeds", ["group_id"], :name => "index_seeds_on_group_id"
  add_index "seeds", ["user_id"], :name => "index_seeds_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "email",           :limit => 300
    t.string   "name",            :limit => 100
    t.string   "slug",            :limit => 100
    t.string   "password_digest"
    t.integer  "login_count",                    :default => 0
    t.datetime "last_login_at"
    t.boolean  "admin"
    t.datetime "created_at",                                    :null => false
    t.datetime "updated_at",                                    :null => false
  end

end
