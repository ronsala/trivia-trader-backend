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

ActiveRecord::Schema.define(version: 2020_12_03_233426) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "favorite"
  end

  create_table "games", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "category_id"
    t.bigint "user_id"
    t.boolean "complete"
    t.index ["category_id"], name: "index_games_on_category_id"
    t.index ["user_id"], name: "index_games_on_user_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "q"
    t.string "aa"
    t.string "ab"
    t.string "ac"
    t.string "ad"
    t.string "correct"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "link"
    t.bigint "game_id"
    t.index ["game_id"], name: "index_questions_on_game_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_digest"
    t.bigint "favorites", default: [], array: true
  end

  add_foreign_key "games", "categories"
  add_foreign_key "games", "users"
  add_foreign_key "questions", "games"
end
