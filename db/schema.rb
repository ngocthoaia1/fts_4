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

ActiveRecord::Schema.define(version: 20140412065738) do

  create_table "admins", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "remember_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "answer_sheet_details", force: true do |t|
    t.integer  "answer_sheet_id"
    t.integer  "question_id"
    t.integer  "answer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "answer_sheet_details", ["answer_sheet_id"], name: "index_answer_sheet_details_on_answer_sheet_id"

  create_table "answer_sheets", force: true do |t|
    t.integer  "user_id"
    t.integer  "subject_test_id"
    t.integer  "total_correct_answereds"
    t.boolean  "passed"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "answer_sheets", ["subject_test_id"], name: "index_answer_sheets_on_subject_test_id"
  add_index "answer_sheets", ["user_id"], name: "index_answer_sheets_on_user_id"

  create_table "answers", force: true do |t|
    t.integer  "question_id"
    t.string   "content"
    t.boolean  "correct"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "questions", force: true do |t|
    t.integer  "subject_id"
    t.string   "content"
    t.integer  "level"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "questions", ["subject_id"], name: "index_questions_on_subject_id"

  create_table "subject_tests", force: true do |t|
    t.integer  "subject_id"
    t.integer  "total_questions"
    t.datetime "time_limit"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "subject_tests", ["subject_id"], name: "index_subject_tests_on_subject_id"

  create_table "subjects", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "remember_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
