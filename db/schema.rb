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

ActiveRecord::Schema.define(version: 20161208192813) do

  create_table "experiences", force: :cascade do |t|
    t.string   "place"
    t.string   "position"
    t.datetime "work_start"
    t.datetime "work_end"
    t.boolean  "current_work", default: false
    t.integer  "post_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["post_id"], name: "index_experiences_on_post_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.integer  "recommendation_id"
    t.integer  "qualification_id"
    t.integer  "experience_id"
    t.integer  "project_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["experience_id"], name: "index_posts_on_experience_id"
    t.index ["project_id"], name: "index_posts_on_project_id"
    t.index ["qualification_id"], name: "index_posts_on_qualification_id"
    t.index ["recommendation_id"], name: "index_posts_on_recommendation_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.integer  "project_yr"
    t.string   "description"
    t.integer  "post_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["post_id"], name: "index_projects_on_post_id"
  end

  create_table "qualifications", force: :cascade do |t|
    t.string   "school"
    t.integer  "grad_yr"
    t.string   "degree"
    t.integer  "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_qualifications_on_post_id"
  end

  create_table "recommendations", force: :cascade do |t|
    t.string   "name"
    t.string   "position"
    t.string   "email"
    t.integer  "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_recommendations_on_post_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
