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

ActiveRecord::Schema.define(version: 20160724172829) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "customers", force: :cascade do |t|
    t.string   "name"
    t.string   "customercode"
    t.string   "address"
    t.string   "addressdetails"
    t.string   "city"
    t.string   "state"
    t.string   "zipcode"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "procedure_work_instructions", force: :cascade do |t|
    t.integer  "procedure_id",        null: false
    t.integer  "work_instruction_id", null: false
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "procedures", force: :cascade do |t|
    t.string   "name",          null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "procedurecode"
  end

  create_table "work_instructions", force: :cascade do |t|
    t.string   "name",         null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "procedure_id"
    t.string   "workcode"
    t.text     "description"
  end

end
