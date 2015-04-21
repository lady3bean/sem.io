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

ActiveRecord::Schema.define(version: 20150421005041) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "languages", force: :cascade do |t|
    t.text "iso_code"
    t.text "name"
  end

  add_index "languages", ["iso_code"], name: "index_languages_on_iso_code", using: :btree

  create_table "word_derivations", force: :cascade do |t|
    t.integer "word_id"
    t.integer "derived_from_id"
  end

  add_index "word_derivations", ["derived_from_id"], name: "index_word_derivations_on_derived_from_id", using: :btree
  add_index "word_derivations", ["word_id"], name: "index_word_derivations_on_word_id", using: :btree

  create_table "word_origins", force: :cascade do |t|
    t.integer "word_id"
    t.integer "origin_id"
  end

  add_index "word_origins", ["origin_id"], name: "index_word_origins_on_origin_id", using: :btree
  add_index "word_origins", ["word_id"], name: "index_word_origins_on_word_id", using: :btree

  create_table "word_relations", force: :cascade do |t|
    t.integer "word_id"
    t.integer "relation_id"
  end

  add_index "word_relations", ["word_id"], name: "index_word_relations_on_word_id", using: :btree

  create_table "words", force: :cascade do |t|
    t.text    "definition"
    t.text    "spelling"
    t.integer "language_id"
  end

  add_index "words", ["language_id"], name: "index_words_on_language_id", using: :btree
  add_index "words", ["spelling"], name: "index_words_on_spelling", using: :btree

  add_foreign_key "word_derivations", "words"
  add_foreign_key "word_derivations", "words", column: "derived_from_id"
  add_foreign_key "word_origins", "words"
  add_foreign_key "word_origins", "words", column: "origin_id"
  add_foreign_key "word_relations", "words"
  add_foreign_key "word_relations", "words", column: "relation_id"
  add_foreign_key "words", "languages"
end
