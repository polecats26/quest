# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_04_06_185303) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "parties", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_parties_on_user_id"
  end

  create_table "party_members", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "party_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["party_id"], name: "index_party_members_on_party_id"
    t.index ["user_id"], name: "index_party_members_on_user_id"
  end

  create_table "party_requests", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "party_id", null: false
    t.boolean "accepted"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["party_id"], name: "index_party_requests_on_party_id"
    t.index ["user_id"], name: "index_party_requests_on_user_id"
  end

  create_table "quest_members", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "quest_id", null: false
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["quest_id"], name: "index_quest_members_on_quest_id"
    t.index ["user_id"], name: "index_quest_members_on_user_id"
  end

  create_table "quests", force: :cascade do |t|
    t.string "title", null: false
    t.text "description", null: false
    t.bigint "user_id", null: false
    t.bigint "party_id", null: false
    t.string "image_url"
    t.boolean "completed"
    t.datetime "completion_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["party_id"], name: "index_quests_on_party_id"
    t.index ["user_id"], name: "index_quests_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "first_name", default: "", null: false
    t.string "last_name", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "active", default: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "parties", "users"
  add_foreign_key "party_members", "parties"
  add_foreign_key "party_members", "users"
  add_foreign_key "party_requests", "parties"
  add_foreign_key "party_requests", "users"
  add_foreign_key "quest_members", "quests"
  add_foreign_key "quest_members", "users"
  add_foreign_key "quests", "parties"
  add_foreign_key "quests", "users"
end
