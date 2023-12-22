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

ActiveRecord::Schema[7.0].define(version: 2023_12_22_144412) do
  create_table "folders", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_folders_on_user_id"
  end

  create_table "memos", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "folder_id"
    t.index ["folder_id"], name: "index_memos_on_folder_id"
  end

  create_table "missions", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "completion_criteria"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "points_value"
  end

  create_table "titles", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_missions", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "mission_id", null: false
    t.boolean "completed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mission_id"], name: "index_user_missions_on_mission_id"
    t.index ["user_id"], name: "index_user_missions_on_user_id"
  end

  create_table "user_titles", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "title_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["title_id"], name: "index_user_titles_on_title_id"
    t.index ["user_id"], name: "index_user_titles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "rank"
    t.integer "points"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "folders", "users"
  add_foreign_key "memos", "folders"
  add_foreign_key "user_missions", "missions"
  add_foreign_key "user_missions", "users"
  add_foreign_key "user_titles", "titles"
  add_foreign_key "user_titles", "users"
end
