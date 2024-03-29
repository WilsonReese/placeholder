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

ActiveRecord::Schema.define(version: 2023_04_11_201245) do

  create_table "reservations", force: :cascade do |t|
    t.integer "user_id"
    t.integer "theater_id"
    t.string "status", default: "pending"
    t.datetime "start_time"
    t.datetime "end_time"
    t.float "duration"
    t.integer "number_guests"
    t.string "content_choice"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["theater_id"], name: "index_reservations_on_theater_id"
    t.index ["user_id"], name: "index_reservations_on_user_id"
  end

  create_table "theaters", force: :cascade do |t|
    t.integer "number_of_seats"
    t.float "turnover_time"
    t.integer "reservations_count"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "username"
    t.integer "reservations_count", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "user_type", default: "standard"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "reservations", "theaters"
  add_foreign_key "reservations", "users"
end
