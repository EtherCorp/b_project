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

ActiveRecord::Schema.define(version: 20171105020446) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "actions", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clasifications", force: :cascade do |t|
    t.bigint "normative_id"
    t.string "code"
    t.text "details"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["normative_id"], name: "index_clasifications_on_normative_id"
  end

  create_table "clasifications_games", id: false, force: :cascade do |t|
    t.bigint "clasification_id", null: false
    t.bigint "game_id", null: false
    t.index ["clasification_id"], name: "index_clasifications_games_on_clasification_id"
    t.index ["game_id"], name: "index_clasifications_games_on_game_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.index ["country_id"], name: "index_countries_currencies_on_country_id"
    t.index ["currency_id"], name: "index_countries_currencies_on_currency_id"
  end

  create_table "countries_stores", id: false, force: :cascade do |t|
    t.bigint "country_id", null: false
    t.bigint "store_id", null: false
    t.index ["country_id"], name: "index_countries_stores_on_country_id"
    t.index ["store_id"], name: "index_countries_stores_on_store_id"
  end

  create_table "currencies", force: :cascade do |t|
    t.string "name"
    t.string "symbol"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "evaluations", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "store_id"
    t.integer "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["store_id"], name: "index_evaluations_on_store_id"
    t.index ["user_id"], name: "index_evaluations_on_user_id"
  end

  create_table "features", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "features_products", id: false, force: :cascade do |t|
    t.bigint "feature_id", null: false
    t.bigint "product_id", null: false
    t.index ["feature_id"], name: "index_features_products_on_feature_id"
    t.index ["product_id"], name: "index_features_products_on_product_id"
  end

  create_table "game_alt_names", force: :cascade do |t|
    t.bigint "game_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_game_alt_names_on_game_id"
  end

  create_table "games", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "games_developers", force: :cascade do |t|
    t.bigint "game_id"
    t.bigint "company_id"
    t.bigint "platform_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_games_developers_on_company_id"
    t.index ["game_id"], name: "index_games_developers_on_game_id"
    t.index ["platform_id"], name: "index_games_developers_on_platform_id"
  end

  create_table "games_genres", id: false, force: :cascade do |t|
    t.bigint "game_id", null: false
    t.bigint "genre_id", null: false
    t.index ["game_id"], name: "index_games_genres_on_game_id"
    t.index ["genre_id"], name: "index_games_genres_on_genre_id"
  end

  create_table "games_keywords", id: false, force: :cascade do |t|
    t.bigint "game_id", null: false
    t.bigint "keyword_id", null: false
    t.index ["game_id"], name: "index_games_keywords_on_game_id"
    t.index ["keyword_id"], name: "index_games_keywords_on_keyword_id"
  end

  create_table "games_products", id: false, force: :cascade do |t|
    t.bigint "game_id", null: false
    t.bigint "product_id", null: false
    t.index ["game_id"], name: "index_games_products_on_game_id"
    t.index ["product_id"], name: "index_games_products_on_product_id"
  end

  create_table "games_publishers", force: :cascade do |t|
    t.bigint "game_id"
    t.bigint "company_id"
    t.bigint "platform_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_games_publishers_on_company_id"
    t.index ["game_id"], name: "index_games_publishers_on_game_id"
    t.index ["platform_id"], name: "index_games_publishers_on_platform_id"
  end

  create_table "genres", force: :cascade do |t|
    t.string "name"
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

  create_table "product_prices", force: :cascade do |t|
    t.bigint "store_product_id"
    t.bigint "currency_id"
    t.decimal "normal_price", precision: 10, scale: 2
    t.decimal "current_price", precision: 10, scale: 2
    t.datetime "flash_deal_ends_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["currency_id"], name: "index_product_prices_on_currency_id"
    t.index ["store_product_id"], name: "index_product_prices_on_store_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.date "release_date"
    t.text "details"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products_users", id: false, force: :cascade do |t|
    t.bigint "product_id", null: false
    t.bigint "user_id", null: false
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
    t.index ["role_id"], name: "index_roles_users_on_role_id"
    t.index ["user_id"], name: "index_roles_users_on_user_id"
  end

  create_table "store_products", force: :cascade do |t|
    t.bigint "store_id"
    t.bigint "product_id"
    t.text "url"
    t.datetime "last_successful_scrap_at"
    t.datetime "last_scrapping_attempt_at"
    t.boolean "stock"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_store_products_on_product_id"
    t.index ["store_id"], name: "index_store_products_on_store_id"
  end

  create_table "stores", force: :cascade do |t|
    t.decimal "average_evaluation", precision: 10, scale: 2
    t.string "name"
    t.string "home_page"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_logs", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "action_id"
    t.string "details"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["action_id"], name: "index_user_logs_on_action_id"
    t.index ["user_id"], name: "index_user_logs_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.bigint "country_id"
    t.string "username"
    t.string "password"
    t.string "encrypted_password"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_users_on_country_id"
  end

end
