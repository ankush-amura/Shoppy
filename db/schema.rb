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

ActiveRecord::Schema.define(version: 20170907062158) do

  create_table "areas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name"
    t.bigint "city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_areas_on_city_id"
  end

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.bigint "category_id"
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["category_id"], name: "index_categories_on_category_id"
  end

  create_table "cities", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name"
    t.string "email"
    t.string "password"
    t.string "contact"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "moderators", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name"
    t.string "email"
    t.string "password"
    t.string "contact"
    t.bigint "superadmin_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["superadmin_id"], name: "index_moderators_on_superadmin_id"
  end

  create_table "replies", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "reply"
    t.bigint "review_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["review_id"], name: "index_replies_on_review_id"
  end

  create_table "reviews", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "message"
    t.string "role"
    t.bigint "shop_id"
    t.bigint "comment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["comment_id"], name: "index_reviews_on_comment_id"
    t.index ["shop_id"], name: "index_reviews_on_shop_id"
  end

  create_table "sales", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name"
    t.string "email"
    t.string "password"
    t.string "contact"
    t.bigint "moderator_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["moderator_id"], name: "index_sales_on_moderator_id"
  end

  create_table "shops", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name"
    t.bigint "city_id"
    t.bigint "area_id"
    t.bigint "user_id"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "approve"
    t.index ["area_id", "city_id", "user_id"], name: "index_shops_on_area_id_and_city_id_and_user_id"
    t.index ["area_id"], name: "index_shops_on_area_id"
    t.index ["category_id"], name: "index_shops_on_category_id"
    t.index ["city_id"], name: "index_shops_on_city_id"
    t.index ["user_id"], name: "index_shops_on_user_id"
  end

  create_table "superadmins", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name"
    t.string "email"
    t.string "password"
    t.string "contact"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name"
    t.string "contact"
    t.bigint "moderator_id"
    t.bigint "superadmin_id"
    t.string "role"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["moderator_id"], name: "index_users_on_moderator_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["superadmin_id"], name: "index_users_on_superadmin_id"
  end

end
