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

ActiveRecord::Schema.define(version: 2021_12_05_093000) do

  create_table "pokemons", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["url"], name: "index_pokemons_on_url", unique: true
  end

  create_table "slots", charset: "utf8mb4", force: :cascade do |t|
    t.integer "slot"
    t.bigint "pokemon_id", null: false
    t.bigint "type_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pokemon_id"], name: "index_slots_on_pokemon_id"
    t.index ["type_id"], name: "index_slots_on_type_id"
  end

  create_table "types", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name", "url"], name: "index_types_on_name_and_url", unique: true
  end

  add_foreign_key "slots", "pokemons"
  add_foreign_key "slots", "types"
end
