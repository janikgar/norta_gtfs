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

ActiveRecord::Schema.define(version: 2018_07_26_215108) do

  create_table "agencies", force: :cascade do |t|
    t.string "agency_name"
    t.string "agency_url"
    t.string "agency_timezone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "agency_lang"
    t.string "agency_phone"
    t.string "agency_fare_url"
  end

  create_table "calendars", force: :cascade do |t|
    t.integer "service_id"
    t.string "days"
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "feed_infos", force: :cascade do |t|
    t.string "feed_publisher_url"
    t.string "feed_lang"
    t.date "feed_start_date"
    t.date "feed_end_date"
    t.string "feed_version"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "feed_publisher_name"
  end

  create_table "routes", force: :cascade do |t|
    t.integer "route_id"
    t.integer "agency_id"
    t.string "route_short_name"
    t.string "route_long_name"
    t.string "route_desc"
    t.string "route_type"
    t.string "route_color"
    t.string "route_text_color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shapes", force: :cascade do |t|
    t.string "shape_id"
    t.float "shape_pt_lat"
    t.string "shape_pt_lon"
    t.integer "shape_pt_sequence"
    t.float "shape_dist_traveled"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stop_times", force: :cascade do |t|
    t.integer "trip_id"
    t.time "arrival_time"
    t.time "departure_time"
    t.integer "stop_id"
    t.integer "stop_sequence"
    t.string "stop_headsign"
    t.integer "pickup_type"
    t.integer "drop_off_type"
    t.float "shape_dist_traveled"
    t.integer "timepoint"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stops", force: :cascade do |t|
    t.integer "stop_id"
    t.string "stop_code"
    t.string "stop_name"
    t.string "stop_desc"
    t.float "stop_lat"
    t.float "stop_lon"
    t.integer "wheelchair_boarding"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trips", force: :cascade do |t|
    t.integer "trip_id"
    t.integer "route_id"
    t.integer "service_id"
    t.string "trip_headsign"
    t.string "trip_short_name"
    t.integer "direction_id"
    t.integer "block_id"
    t.integer "shape_id"
    t.integer "wheelchair_accessible"
    t.integer "bikes_allowed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
