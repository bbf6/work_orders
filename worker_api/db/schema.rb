# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_02_20_175759) do
  create_table "client_branches", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "client_id", null: false
    t.bigint "client_manager_id", null: false
    t.string "address", limit: 1000
    t.string "email", limit: 50
    t.boolean "status", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_client_branches_on_client_id"
    t.index ["client_manager_id"], name: "index_client_branches_on_client_manager_id"
  end

  create_table "client_manager_phones", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "client_manager_id", null: false
    t.string "description", limit: 50
    t.string "number", limit: 20
    t.boolean "status", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_manager_id"], name: "index_client_manager_phones_on_client_manager_id"
  end

  create_table "client_managers", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", limit: 50
    t.string "last_name", limit: 50
    t.string "mother_last_name", limit: 50
    t.boolean "status", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clients", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", limit: 200
    t.boolean "status", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "retainers", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.datetime "service_date"
    t.bigint "work_order_id"
    t.bigint "client_branch_id", null: false
    t.boolean "status", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_branch_id"], name: "index_retainers_on_client_branch_id"
    t.index ["work_order_id"], name: "index_retainers_on_work_order_id"
  end

  create_table "thecnician_phones", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "thecnician_id", null: false
    t.string "description", limit: 50
    t.string "number", limit: 20
    t.boolean "status", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["thecnician_id"], name: "index_thecnician_phones_on_thecnician_id"
  end

  create_table "thecnicians", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", limit: 50
    t.string "last_name", limit: 50
    t.string "mother_last_name", limit: 50
    t.date "birth_date"
    t.boolean "sex"
    t.string "email"
    t.binary "pic"
    t.boolean "status", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tickets", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.datetime "accident_date"
    t.string "details", limit: 8000
    t.bigint "work_order_id"
    t.bigint "client_branch_id", null: false
    t.boolean "status", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_branch_id"], name: "index_tickets_on_client_branch_id"
    t.index ["work_order_id"], name: "index_tickets_on_work_order_id"
  end

  create_table "work_orders", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "thecnician_id"
    t.datetime "begining_attention_date"
    t.datetime "ending_attention_date"
    t.integer "status", default: 1, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["thecnician_id"], name: "index_work_orders_on_thecnician_id"
  end

  add_foreign_key "client_branches", "client_managers"
  add_foreign_key "client_branches", "clients"
  add_foreign_key "client_manager_phones", "client_managers"
  add_foreign_key "retainers", "client_branches"
  add_foreign_key "retainers", "work_orders"
  add_foreign_key "thecnician_phones", "thecnicians"
  add_foreign_key "tickets", "client_branches"
  add_foreign_key "tickets", "work_orders"
  add_foreign_key "work_orders", "thecnicians"
end
