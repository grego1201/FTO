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

ActiveRecord::Schema.define(version: 2021_12_08_142151) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "competitions", force: :cascade do |t|
    t.string "name"
    t.date "date"
    t.string "location"
    t.string "gender"
    t.string "category"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "competitions_fencers", id: false, force: :cascade do |t|
    t.bigint "competition_id", null: false
    t.bigint "fencer_id", null: false
    t.index ["competition_id", "fencer_id"], name: "index_competitions_fencers_on_competition_id_and_fencer_id"
    t.index ["fencer_id", "competition_id"], name: "index_competitions_fencers_on_fencer_id_and_competition_id"
  end

  create_table "fencers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "gender"
    t.date "birthday"
    t.string "country"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "matches", force: :cascade do |t|
    t.integer "left_points"
    t.integer "right_points"
    t.boolean "priority"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "poule_id"
    t.bigint "referee_id"
    t.bigint "right_fencer_id"
    t.bigint "left_fencer_id"
    t.index ["left_fencer_id"], name: "index_matches_on_left_fencer_id"
    t.index ["poule_id"], name: "index_matches_on_poule_id"
    t.index ["referee_id"], name: "index_matches_on_referee_id"
    t.index ["right_fencer_id"], name: "index_matches_on_right_fencer_id"
  end

  create_table "poules", force: :cascade do |t|
    t.integer "number"
    t.integer "piste"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "competition_id"
    t.bigint "referee_id"
    t.index ["competition_id"], name: "index_poules_on_competition_id"
    t.index ["referee_id"], name: "index_poules_on_referee_id"
  end

  create_table "referees", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "country"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "competitions_fencers", "competitions"
  add_foreign_key "competitions_fencers", "fencers"
  add_foreign_key "matches", "fencers", column: "left_fencer_id"
  add_foreign_key "matches", "fencers", column: "right_fencer_id"
end
