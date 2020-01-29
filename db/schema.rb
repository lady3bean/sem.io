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

ActiveRecord::Schema.define(version: 2020_01_29_192025) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "languages", id: :serial, force: :cascade do |t|
    t.text "iso_code"
    t.text "name"
    t.index ["iso_code"], name: "index_languages_on_iso_code"
  end

  create_table "word_derivations", id: :serial, force: :cascade do |t|
    t.integer "word_id"
    t.integer "derived_from_id"
    t.index ["derived_from_id"], name: "index_word_derivations_on_derived_from_id"
    t.index ["word_id"], name: "index_word_derivations_on_word_id"
  end

  create_table "word_origins", id: :serial, force: :cascade do |t|
    t.integer "word_id"
    t.integer "origin_id"
    t.index ["origin_id"], name: "index_word_origins_on_origin_id"
    t.index ["word_id"], name: "index_word_origins_on_word_id"
  end

  create_table "word_relations", id: :serial, force: :cascade do |t|
    t.integer "word_id"
    t.integer "relation_id"
    t.index ["word_id"], name: "index_word_relations_on_word_id"
  end

  create_table "words", id: :serial, force: :cascade do |t|
    t.text "definition"
    t.text "spelling"
    t.integer "language_id"
    t.index ["language_id"], name: "index_words_on_language_id"
    t.index ["spelling"], name: "index_words_on_spelling"
  end

  add_foreign_key "word_derivations", "words"
  add_foreign_key "word_derivations", "words", column: "derived_from_id"
  add_foreign_key "word_origins", "words"
  add_foreign_key "word_origins", "words", column: "origin_id"
  add_foreign_key "word_relations", "words"
  add_foreign_key "word_relations", "words", column: "relation_id"
  add_foreign_key "words", "languages"
end
