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

ActiveRecord::Schema.define(version: 2020_02_01_072602) do

  create_table "cars", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.date "inspection_date", null: false
    t.string "image", null: false
    t.integer "model_year", null: false
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "distance", null: false
    t.index ["user_id"], name: "index_cars_on_user_id"
  end

  create_table "events", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "customer_id", null: false
    t.bigint "sales_id", null: false
    t.string "title", null: false
    t.date "date", null: false
    t.bigint "car_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["car_id"], name: "index_events_on_car_id"
    t.index ["customer_id"], name: "index_events_on_customer_id"
    t.index ["sales_id"], name: "index_events_on_sales_id"
  end

  create_table "messages", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "customer_id", null: false
    t.bigint "sales_id", null: false
    t.text "text"
    t.string "image"
    t.bigint "car_id"
    t.bigint "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "talker_id"
    t.index ["car_id"], name: "index_messages_on_car_id"
    t.index ["customer_id"], name: "index_messages_on_customer_id"
    t.index ["event_id"], name: "index_messages_on_event_id"
    t.index ["sales_id"], name: "index_messages_on_sales_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.integer "sales_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["name"], name: "index_users_on_name"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "cars", "users"
  add_foreign_key "events", "cars"
  add_foreign_key "events", "users", column: "customer_id"
  add_foreign_key "events", "users", column: "sales_id"
  add_foreign_key "messages", "cars"
  add_foreign_key "messages", "events"
  add_foreign_key "messages", "users", column: "customer_id"
  add_foreign_key "messages", "users", column: "sales_id"
end
