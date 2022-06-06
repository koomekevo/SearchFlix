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

ActiveRecord::Schema[7.0].define(version: 2022_06_06_134246) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "films", force: :cascade do |t|
    t.jsonb "budget"
    t.jsonb "description"
    t.jsonb "external_ids"
    t.string "length"
    t.string "movie_type"
    t.date "premiere_bluray"
    t.date "premiere_digital"
    t.date "premiere_dvd"
    t.date "premiere_world"
    t.jsonb "rating"
    t.integer "rating_age_limits"
    t.string "rating_mpaa"
    t.jsonb "remote_images"
    t.jsonb "slogan"
    t.string "slug"
    t.string "source"
    t.string "source_lang"
    t.jsonb "title"
    t.integer "year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
