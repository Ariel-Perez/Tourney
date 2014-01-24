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

ActiveRecord::Schema.define(version: 20140124144135) do

  create_table "applications", force: true do |t|
    t.integer  "player_id"
    t.integer  "status"
    t.text     "message"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "vacancy_id"
  end

  create_table "invitations", force: true do |t|
    t.integer  "team_id"
    t.integer  "player_id"
    t.integer  "status"
    t.text     "message"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "role_id"
  end

  create_table "memberships", force: true do |t|
    t.integer  "player_id"
    t.integer  "team_id"
    t.integer  "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "active"
  end

  create_table "players", force: true do |t|
    t.string   "nick"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "country"
    t.date     "birth_date"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "players_roles", force: true do |t|
    t.integer  "player_id"
    t.integer  "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teams", force: true do |t|
    t.string   "name"
    t.string   "short_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "player_id"
  end

  create_table "tournaments", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vacancies", force: true do |t|
    t.integer  "team_id"
    t.integer  "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "requirements"
  end

end
