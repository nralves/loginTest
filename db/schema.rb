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

ActiveRecord::Schema.define(:version => 20130626220635) do

  create_table "blocks", :force => true do |t|
    t.string   "name"
    t.datetime "begin"
    t.datetime "end"
    t.string   "room"
    t.integer  "conference_id"
    t.integer  "track_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "conferences", :force => true do |t|
    t.string   "name"
    t.datetime "begin"
    t.datetime "end"
    t.string   "location"
    t.string   "logo"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "conferences_users", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "conference_id"
  end

  create_table "emails", :force => true do |t|
    t.string   "email"
    t.string   "activation"
    t.boolean  "confirmed"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "events", :force => true do |t|
    t.string   "name"
    t.text     "abstract"
    t.integer  "block_id"
    t.string   "file"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "events_lecturers", :id => false, :force => true do |t|
    t.integer "event_id"
    t.integer "lecturer_id"
  end

  create_table "friendships", :force => true do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "lecturers", :force => true do |t|
    t.string   "name"
    t.string   "title"
    t.string   "organization"
    t.string   "country"
    t.string   "homepage"
    t.string   "resume"
    t.string   "photo"
    t.string   "email"
    t.integer  "user_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "image"
  end

  create_table "lecturers_posters", :id => false, :force => true do |t|
    t.integer "poster_id"
    t.integer "lecturer_id"
  end

  create_table "news", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "conference_id"
  end

  create_table "participants", :force => true do |t|
    t.string   "email"
    t.integer  "conference_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "posters", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "file"
    t.string   "poster"
    t.integer  "block_id"
    t.integer  "votes"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "requests", :force => true do |t|
    t.integer  "user_id"
    t.integer  "requester_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "tracks", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "name"
    t.string   "title"
    t.string   "organization"
    t.string   "homepage"
    t.string   "photo"
  end

end
