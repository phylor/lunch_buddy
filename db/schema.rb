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

ActiveRecord::Schema.define(version: 20170706125048) do

  create_table "daily_menus", force: :cascade do |t|
    t.datetime "date", null: false
    t.string "content", null: false
    t.integer "restaurant_id", null: false
    t.index ["date", "restaurant_id"], name: "index_daily_menus_on_date_and_restaurant_id", unique: true
    t.index ["restaurant_id"], name: "index_daily_menus_on_restaurant_id"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "name", null: false
  end

end
