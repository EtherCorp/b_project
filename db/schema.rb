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

ActiveRecord::Schema.define(version: 20171101173657) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "actions", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories_games", id: false, force: :cascade do |t|
    t.bigint "category_id", null: false
    t.bigint "game_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_categories_games_on_category_id"
    t.index ["game_id"], name: "index_categories_games_on_game_id"
  end

  create_table "clasifications", force: :cascade do |t|
    t.bigint "normative_id"
    t.string "code"
    t.string "details"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["normative_id"], name: "index_clasifications_on_normative_id"
  end

  create_table "clasifications_games", id: false, force: :cascade do |t|
    t.bigint "clasification_id", null: false
    t.bigint "game_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["clasification_id"], name: "index_clasifications_games_on_clasification_id"
    t.index ["game_id"], name: "index_clasifications_games_on_game_id"
  end

  create_table "countries", force: :cascade do |t|
    t.bigint "normative_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["normative_id"], name: "index_countries_on_normative_id"
  end

  create_table "countries_currencies", id: false, force: :cascade do |t|
    t.bigint "country_id", null: false
    t.bigint "currency_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_countries_currencies_on_country_id"
    t.index ["currency_id"], name: "index_countries_currencies_on_currency_id"
  end

  create_table "countries_stores", id: false, force: :cascade do |t|
    t.bigint "country_id", null: false
    t.bigint "store_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_countries_stores_on_country_id"
    t.index ["store_id"], name: "index_countries_stores_on_store_id"
  end

  create_table "currencies", force: :cascade do |t|
    t.string "name"
    t.string "symbol"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "developers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "games", force: :cascade do |t|
    t.bigint "developer_id"
    t.string "name"
    t.date "release_date"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["developer_id"], name: "index_games_on_developer_id"
  end

  create_table "games_keywords", id: false, force: :cascade do |t|
    t.bigint "game_id", null: false
    t.bigint "keyword_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_games_keywords_on_game_id"
    t.index ["keyword_id"], name: "index_games_keywords_on_keyword_id"
  end

  create_table "games_products", id: false, force: :cascade do |t|
    t.bigint "game_id", null: false
    t.bigint "product_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_games_products_on_game_id"
    t.index ["product_id"], name: "index_games_products_on_product_id"
  end

  create_table "igdb_keys", force: :cascade do |t|
    t.string "key"
    t.datetime "last_used"
    t.boolean "is_active"
    t.string "owner_email"
    t.string "key_class"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "keywords", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "normatives", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "platforms", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "prices_products", id: false, force: :cascade do |t|
    t.bigint "price_id", null: false
    t.bigint "product_id", null: false
    t.decimal "normal_price"
    t.decimal "current_price"
    t.datetime "flash_deal_ends_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["price_id"], name: "index_prices_products_on_price_id"
    t.index ["product_id"], name: "index_prices_products_on_product_id"
  end

  create_table "product_stores", force: :cascade do |t|
    t.bigint "product_id_id"
    t.bigint "store_id_id"
    t.text "product_url"
    t.boolean "stock"
    t.datetime "last_scrapping_attempt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id_id"], name: "index_product_stores_on_product_id_id"
    t.index ["store_id_id"], name: "index_product_stores_on_store_id_id"
  end

  create_table "products", force: :cascade do |t|
    t.bigint "plataform_id"
    t.string "name"
    t.text "aditional_details"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["plataform_id"], name: "index_products_on_plataform_id"
  end

  create_table "products_users", id: false, force: :cascade do |t|
    t.bigint "product_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_products_users_on_product_id"
    t.index ["user_id"], name: "index_products_users_on_user_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles_users", id: false, force: :cascade do |t|
    t.bigint "role_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_roles_users_on_role_id"
    t.index ["user_id"], name: "index_roles_users_on_user_id"
  end

  create_table "stores", force: :cascade do |t|
    t.decimal "average_eval"
    t.string "store_name"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stores_users", id: false, force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "store_id", null: false
    t.integer "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["store_id"], name: "index_stores_users_on_store_id"
    t.index ["user_id"], name: "index_stores_users_on_user_id"
  end

  create_table "user_logs", force: :cascade do |t|
    t.bigint "action_id"
    t.bigint "user_id"
    t.json "affected_items"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["action_id"], name: "index_user_logs_on_action_id"
    t.index ["user_id"], name: "index_user_logs_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "name"
    t.string "nickname"
    t.string "image"
    t.string "email"
    t.json "tokens"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

end
