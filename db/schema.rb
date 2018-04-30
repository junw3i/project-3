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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 2018_04_29_114649) do
=======
ActiveRecord::Schema.define(version: 2018_04_28_181519) do
>>>>>>> daa0aaa4029875aa10e08323d3f5908cacb4ffa0

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "consults", force: :cascade do |t|
    t.bigint "user_id"
    t.text "history"
    t.text "prescription"
    t.integer "mc"
    t.integer "doctor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "mc_start"
    t.string "mc_end"
    t.index ["user_id"], name: "index_consults_on_user_id"
  end

  create_table "requests", force: :cascade do |t|
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "description"
    t.index ["user_id"], name: "index_requests_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "role", default: "patient"
    t.string "id_number"
    t.string "gender"
    t.integer "mobile"
    t.boolean "is_live", default: true
    t.string "appointment_date"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "consults", "users"
  add_foreign_key "requests", "users"
end
