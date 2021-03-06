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

ActiveRecord::Schema.define(version: 2022_04_27_093249) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "chatrooms", force: :cascade do |t|
    t.string "name"
    t.string "string"
    t.bigint "game_session_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["game_session_id"], name: "index_chatrooms_on_game_session_id"
  end

  create_table "game_sessions", force: :cascade do |t|
    t.string "description"
    t.date "date"
    t.time "time"
    t.bigint "user_id", null: false
    t.bigint "game_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["game_id"], name: "index_game_sessions_on_game_id"
    t.index ["user_id"], name: "index_game_sessions_on_user_id"
  end

  create_table "games", force: :cascade do |t|
    t.string "name"
    t.string "controller"
    t.string "summary"
    t.string "category"
    t.string "thumbnail"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "games_list_game", force: :cascade do |t|
    t.bigint "games_list_id", null: false
    t.bigint "game_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["game_id"], name: "index_games_list_game_on_game_id"
    t.index ["games_list_id"], name: "index_games_list_game_on_games_list_id"
  end

  create_table "games_lists", force: :cascade do |t|
    t.string "name"
    t.string "category"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_games_lists_on_user_id"
  end

  create_table "games_session_list", force: :cascade do |t|
    t.boolean "subscribe", default: false
    t.bigint "user_id", null: false
    t.bigint "game_session_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["game_session_id"], name: "index_games_session_list_on_game_session_id"
    t.index ["user_id"], name: "index_games_session_list_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.string "content"
    t.bigint "user_id", null: false
    t.bigint "chatroom_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["chatroom_id"], name: "index_messages_on_chatroom_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "chatrooms", "game_sessions"
  add_foreign_key "game_sessions", "games"
  add_foreign_key "game_sessions", "users"
  add_foreign_key "games_list_game", "games"
  add_foreign_key "games_list_game", "games_lists"
  add_foreign_key "games_lists", "users"
  add_foreign_key "games_session_list", "game_sessions"
  add_foreign_key "games_session_list", "users"
  add_foreign_key "messages", "chatrooms"
  add_foreign_key "messages", "users"
end
