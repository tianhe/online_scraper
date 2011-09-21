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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110921024406) do

  create_table "travel_zoo_cities", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "travel_zoo_deals", :force => true do |t|
    t.string   "url"
    t.boolean  "expired"
    t.integer  "quantity_sold"
    t.integer  "offer_price"
    t.integer  "full_price"
    t.boolean  "limit_reached"
    t.datetime "expiration_date"
    t.datetime "effective_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
