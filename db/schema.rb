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

ActiveRecord::Schema.define(version: 20150827092049) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "courses", force: :cascade do |t|
    t.integer  "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "groups", force: :cascade do |t|
    t.integer  "course_id"
    t.string   "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "groups", ["course_id"], name: "index_groups_on_course_id", using: :btree

  create_table "marks", force: :cascade do |t|
    t.integer  "semester_id"
    t.integer  "subject_id"
    t.integer  "student_id"
    t.integer  "value"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "marks", ["semester_id"], name: "index_marks_on_semester_id", using: :btree
  add_index "marks", ["student_id"], name: "index_marks_on_student_id", using: :btree
  add_index "marks", ["subject_id"], name: "index_marks_on_subject_id", using: :btree

  create_table "semester_subjects", force: :cascade do |t|
    t.integer  "semester_id"
    t.integer  "subject_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "semester_subjects", ["semester_id"], name: "index_semester_subjects_on_semester_id", using: :btree
  add_index "semester_subjects", ["subject_id"], name: "index_semester_subjects_on_subject_id", using: :btree

  create_table "semesters", force: :cascade do |t|
    t.integer  "group_id"
    t.integer  "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "semesters", ["group_id"], name: "index_semesters_on_group_id", using: :btree

  create_table "students", force: :cascade do |t|
    t.integer  "group_id"
    t.string   "name"
    t.string   "surname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "email"
  end

  add_index "students", ["group_id"], name: "index_students_on_group_id", using: :btree

  create_table "subjects", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "groups", "courses"
  add_foreign_key "marks", "semesters"
  add_foreign_key "marks", "students"
  add_foreign_key "marks", "subjects"
  add_foreign_key "semester_subjects", "semesters"
  add_foreign_key "semester_subjects", "subjects"
  add_foreign_key "semesters", "groups"
  add_foreign_key "students", "groups"
end
