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

ActiveRecord::Schema[7.0].define(version: 2023_12_12_074052) do
  create_table "friend_requests", force: :cascade do |t|
    t.integer "receiver_id", null: false
    t.integer "sender_id", null: false
    t.string "status", default: "pending"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["receiver_id"], name: "index_friend_requests_on_receiver_id"
    t.index ["sender_id"], name: "index_friend_requests_on_sender_id"
  end

  create_table "pings", force: :cascade do |t|
    t.integer "poker_id", null: false
    t.integer "task_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["poker_id"], name: "index_pings_on_poker_id"
    t.index ["task_id"], name: "index_pings_on_task_id"
  end

  create_table "taskies", force: :cascade do |t|
    t.text "description"
    t.date "due_date"
    t.time "due_time"
    t.integer "completion"
    t.integer "ping_frequency"
    t.integer "owner_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_id"], name: "index_taskies_on_owner_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.text "description"
    t.date "due_date"
    t.time "due_time"
    t.boolean "completion", default: false
    t.integer "ping_frequency"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "owner_id", null: false
    t.integer "pings_count", default: 0
    t.index ["owner_id"], name: "index_tasks_on_owner_id"
  end

  create_table "users", force: :cascade do |t|
    t.text "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.text "username"
    t.boolean "private", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "pings_count", default: 0
    t.integer "tasks_count", default: 0
    t.integer "friendship_id"
    t.string "og_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "friend_requests", "users", column: "receiver_id"
  add_foreign_key "friend_requests", "users", column: "sender_id"
  add_foreign_key "pings", "tasks"
  add_foreign_key "pings", "users", column: "poker_id"
  add_foreign_key "taskies", "owners"
  add_foreign_key "tasks", "users", column: "owner_id"
end
