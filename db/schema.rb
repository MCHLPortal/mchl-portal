# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20170305200804) do

  create_table "employees", force: :cascade do |t|
    t.string   "fname"
    t.string   "mname"
    t.string   "lname"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "sections_id"
    t.string   "employee_id"
    t.string   "password_digest"
    t.boolean  "admin"
    t.string   "username"
  end

  add_index "employees", ["sections_id"], name: "index_employees_on_sections_id"

  create_table "sections", force: :cascade do |t|
    t.string   "name"
    t.string   "level"
    t.string   "room_number"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "students", force: :cascade do |t|
    t.string   "username"
    t.string   "password_digest"
    t.string   "fname"
    t.string   "mname"
    t.string   "lname"
    t.string   "sex",                    limit: 1
    t.string   "address"
    t.date     "birthdate"
    t.string   "handedness"
    t.string   "father_fname"
    t.string   "father_mname"
    t.string   "father_lname"
    t.string   "father_occupation"
    t.integer  "father_age"
    t.string   "father_educ_attainment"
    t.string   "mother_fname"
    t.string   "mother_mname"
    t.string   "mother_lname"
    t.string   "mother_occupation"
    t.integer  "mother_age"
    t.string   "mother_educ_attainment"
    t.string   "student_id"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "age"
    t.integer  "sections_id"
  end

  add_index "students", ["sections_id"], name: "index_students_on_sections_id"

  create_table "subjects", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
