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

ActiveRecord::Schema[7.0].define(version: 2026_03_17_090147) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "lessons", force: :cascade do |t|
    t.text "questions", default: [], array: true
    t.text "level"
    t.text "topic"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lessons_questions", id: false, force: :cascade do |t|
    t.integer "lesson_id"
    t.integer "question_id"
  end

  create_table "questions", force: :cascade do |t|
    t.text "sentence"
    t.string "answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "quizzes", force: :cascade do |t|
    t.bigint "user_id"
    t.text "score"
    t.bigint "word_id"
    t.text "words", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_quizzes_on_user_id"
    t.index ["word_id"], name: "index_quizzes_on_word_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "name"
    t.string "level"
    t.string "invoicee"
    t.text "schedule"
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
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "word_lists", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id"
    t.bigint "word_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_word_lists_on_user_id"
    t.index ["word_id"], name: "index_word_lists_on_word_id"
  end

  create_table "words", force: :cascade do |t|
    t.string "word"
    t.text "definition"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
