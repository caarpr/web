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

ActiveRecord::Schema.define(version: 20170508015040) do

  create_table "attendees", force: :cascade do |t|
    t.string   "event_type"
    t.integer  "event_id"
    t.integer  "volunteer_id"
    t.string   "status",       default: "attending"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.index ["event_type", "event_id"], name: "index_attendees_on_event_type_and_event_id"
    t.index ["volunteer_id"], name: "index_attendees_on_volunteer_id"
  end

  create_table "table_events", force: :cascade do |t|
    t.integer  "table_location_id"
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.integer  "postcards_collected"
    t.integer  "volunteers_collected"
    t.string   "status"
    t.string   "scheduled"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["table_location_id"], name: "index_table_events_on_table_location_id"
  end

  create_table "table_locations", force: :cascade do |t|
    t.string   "name"
    t.string   "status",     default: "recurring"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "ward"
  end

  create_table "volunteers", force: :cascade do |t|
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "first_name"
    t.string   "last_name"
  end

end
