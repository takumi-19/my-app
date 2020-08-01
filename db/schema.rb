# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_08_01_185456) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.text "content"
    t.string "image"
    t.bigint "supporter_id"
    t.bigint "room_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["room_id"], name: "index_comments_on_room_id"
    t.index ["supporter_id"], name: "index_comments_on_supporter_id"
  end

  create_table "matches", force: :cascade do |t|
    t.integer "week", null: false
    t.datetime "kick_off", null: false
    t.bigint "home_team_id", null: false
    t.bigint "away_team_id", null: false
    t.bigint "stadium_id", null: false
    t.integer "home_team_score"
    t.integer "away_team_score"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["away_team_id"], name: "index_matches_on_away_team_id"
    t.index ["home_team_id"], name: "index_matches_on_home_team_id"
    t.index ["stadium_id"], name: "index_matches_on_stadium_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "player_name", null: false
    t.integer "uniform_number", null: false
    t.string "position"
    t.string "foot"
    t.integer "height"
    t.integer "weight"
    t.bigint "team_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["team_id"], name: "index_players_on_team_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.bigint "team_id"
    t.bigint "match_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["match_id"], name: "index_rooms_on_match_id"
    t.index ["team_id"], name: "index_rooms_on_team_id"
  end

  create_table "stadia", force: :cascade do |t|
    t.string "stadium_name", null: false
    t.string "city", null: false
  end

  create_table "supporters", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "avatar_image", default: ""
    t.text "biography", default: "よろしくお願いします"
    t.bigint "team_id", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_supporters_on_email", unique: true
    t.index ["name"], name: "index_supporters_on_name"
    t.index ["reset_password_token"], name: "index_supporters_on_reset_password_token", unique: true
    t.index ["team_id"], name: "index_supporters_on_team_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "team_name", null: false
    t.string "team_logo", null: false
    t.string "team_color", null: false
  end

  add_foreign_key "comments", "rooms"
  add_foreign_key "comments", "supporters"
  add_foreign_key "matches", "stadia"
  add_foreign_key "matches", "teams", column: "away_team_id"
  add_foreign_key "matches", "teams", column: "home_team_id"
  add_foreign_key "players", "teams"
  add_foreign_key "rooms", "matches"
  add_foreign_key "rooms", "teams"
  add_foreign_key "supporters", "teams"
end
