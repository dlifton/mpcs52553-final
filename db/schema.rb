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

ActiveRecord::Schema.define(version: 20170804202549) do

  create_table "bookings", force: :cascade do |t|
    t.integer "chef_id"
    t.integer "user_id"
    t.date "date"
    t.time "time"
    t.text "address"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["chef_id"], name: "index_bookings_on_chef_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "chefs", force: :cascade do |t|
    t.text "name"
    t.text "description"
    t.text "email"
    t.text "photo_url"
    t.text "address"
    t.text "cuisine"
    t.text "phone"
    t.text "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "foods", force: :cascade do |t|
    t.integer "user_id"
    t.integer "menu_id"
    t.string "title"
    t.string "foodimage_file_name"
    t.string "foodimage_content_type"
    t.integer "foodimage_file_size"
    t.datetime "foodimage_updated_at"
    t.string "description"
    t.index ["menu_id"], name: "index_foods_on_menu_id"
    t.index ["user_id"], name: "index_foods_on_user_id"
  end

  create_table "menus", force: :cascade do |t|
    t.integer "user_id"
    t.integer "price"
    t.text "title"
    t.text "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "menuimage_file_name"
    t.string "menuimage_content_type"
    t.integer "menuimage_file_size"
    t.datetime "menuimage_updated_at"
    t.text "cuisine"
    t.index ["user_id"], name: "index_menus_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "chef_id"
    t.integer "rating"
    t.text "content"
    t.datetime "created_at"
    t.integer "user_id"
    t.integer "menu_id"
    t.index ["chef_id"], name: "index_reviews_on_chef_id"
    t.index ["menu_id"], name: "index_reviews_on_menu_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.text "name"
    t.text "email"
    t.text "address"
    t.text "phone"
    t.text "photo_url"
    t.text "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.integer "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.text "role"
    t.text "cuisine"
    t.text "description"
  end

end
