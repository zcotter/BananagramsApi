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

ActiveRecord::Schema.define(version: 20141029213749) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bananagrams_games", force: true do |t|
    t.integer  "first_player_id"
    t.integer  "second_player_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "poc"
  end

  create_table "bananagrams_moves", force: true do |t|
    t.integer  "bananagrams_game_id"
    t.string   "x0"
    t.string   "y0"
    t.string   "x1"
    t.string   "y1"
    t.string   "letter"
    t.integer  "bananagrams_player_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "letters"
  end

  add_index "bananagrams_moves", ["bananagrams_game_id"], name: "index_bananagrams_moves_on_bananagrams_game_id", using: :btree
  add_index "bananagrams_moves", ["bananagrams_player_id"], name: "index_bananagrams_moves_on_bananagrams_player_id", using: :btree

  create_table "bananagrams_players", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "registration_id"
  end

  create_table "bananagrams_scores", force: true do |t|
    t.integer  "score"
    t.integer  "bananagrams_player_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bananagrams_scores", ["bananagrams_player_id"], name: "index_bananagrams_scores_on_bananagrams_player_id", using: :btree
  add_index "bananagrams_scores", ["score"], name: "index_bananagrams_scores_on_score", using: :btree

  create_table "delayed_jobs", force: true do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

end
