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

ActiveRecord::Schema.define(version: 20170512003527) do

  create_table "experiences", force: :cascade do |t|
    t.string   "place"
    t.string   "position"
    t.datetime "work_start"
    t.datetime "work_end"
    t.boolean  "current_work", default: false
    t.integer  "post_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.text     "detail"
    t.index ["post_id"], name: "index_experiences_on_post_id"
  end

  create_table "others", force: :cascade do |t|
    t.string   "title"
    t.text     "detail"
    t.integer  "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_others_on_post_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "permalink"
    t.string   "category"
    t.text     "about"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.integer  "user_id"
    t.index ["permalink"], name: "index_posts_on_permalink"
    t.index ["user_id"], name: "index_posts_on_user_id"
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
    t.text     "detail"
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

  create_table "skills", force: :cascade do |t|
    t.string   "talent"
    t.integer  "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_skills_on_post_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",            null: false
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
