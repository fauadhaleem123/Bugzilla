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

ActiveRecord::Schema.define(version: 2020_01_03_160833) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bugs", force: :cascade do |t|
    t.string "title"
    t.date "deadline"
    t.string "bug_type"
    t.string "status"
    t.integer "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
    t.integer "developer_id"
    t.integer "qa_id"
    t.index ["developer_id"], name: "index_bugs_on_developer_id"
    t.index ["project_id"], name: "index_bugs_on_project_id"
    t.index ["qa_id"], name: "index_bugs_on_qa_id"
  end

  create_table "developers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "developers_projects", id: false, force: :cascade do |t|
    t.integer "developer_id", null: false
    t.integer "project_id", null: false
  end

  create_table "managers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.text "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "manager_id"
  end

  create_table "projects_qas", id: false, force: :cascade do |t|
    t.integer "qa_id", null: false
    t.integer "project_id", null: false
  end

  create_table "qas", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "type", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
