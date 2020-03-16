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

ActiveRecord::Schema.define(version: 2020_03_14_165601) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "districts", force: :cascade do |t|
    t.bigint "state_id"
    t.string "name"
    t.index ["state_id"], name: "index_districts_on_state_id"
  end

  create_table "reports", force: :cascade do |t|
    t.integer "under_observation"
    t.integer "under_home_isolation"
    t.integer "hospitalised_today"
    t.integer "total_hospitalised"
    t.integer "corona_positive"
    t.integer "cured_discharged"
    t.integer "deaths"
    t.bigint "district_id"
    t.index ["district_id"], name: "index_reports_on_district_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "title"
  end

  create_table "skills", force: :cascade do |t|
    t.string "title"
  end

  create_table "state_admin", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "state_id"
    t.index ["state_id"], name: "index_state_admin_on_state_id"
    t.index ["user_id"], name: "index_state_admin_on_user_id"
  end

  create_table "states", force: :cascade do |t|
    t.string "name"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "age"
    t.integer "mobile_number"
    t.string "username"
    t.string "sex"
    t.bigint "district_id"
    t.index ["district_id"], name: "index_users_on_district_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "volunteers", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.bigint "skill_id"
    t.boolean "available"
    t.index ["role_id"], name: "index_volunteers_on_role_id"
    t.index ["skill_id"], name: "index_volunteers_on_skill_id"
    t.index ["user_id"], name: "index_volunteers_on_user_id"
  end

end
