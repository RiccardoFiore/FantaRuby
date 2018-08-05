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

ActiveRecord::Schema.define(version: 2018_08_05_135431) do

  create_table "admins", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "formazionis", force: :cascade do |t|
    t.integer "user_id"
    t.integer "giornata"
    t.integer "portiere"
    t.integer "difensore1"
    t.integer "difensore2"
    t.integer "difensore3"
    t.integer "centrocampista1"
    t.integer "centrocampista2"
    t.integer "centrocampista3"
    t.integer "centrocampista4"
    t.integer "attaccante1"
    t.integer "attaccante2"
    t.integer "attaccante3"
    t.integer "riservapor"
    t.integer "riservadif"
    t.integer "riservacen"
    t.integer "riservaatt"
    t.integer "punteggio", default: 0
  end

  create_table "homes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "leagues", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "president_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
    t.integer "players"
    t.integer "current_day", default: 1
  end

  create_table "roses", force: :cascade do |t|
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "portiere1"
    t.integer "portiere2"
    t.integer "portiere3"
    t.integer "difensore1"
    t.integer "difensore2"
    t.integer "difensore3"
    t.integer "difensore4"
    t.integer "difensore5"
    t.integer "difensore6"
    t.integer "difensore7"
    t.integer "centrocampista1"
    t.integer "centrocampista2"
    t.integer "centrocampista3"
    t.integer "centrocampista4"
    t.integer "centrocampista5"
    t.integer "centrocampista6"
    t.integer "centrocampista7"
    t.integer "centrocampista8"
    t.integer "attaccante1"
    t.integer "attaccante2"
    t.integer "attaccante3"
    t.integer "attaccante4"
    t.integer "attaccante5"
    t.integer "attaccante6"
    t.integer "inseriti", default: 0
  end

  create_table "soccers_players", force: :cascade do |t|
    t.integer "cod"
    t.string "cognome"
    t.string "ruolo"
    t.integer "quotazione"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "daily_score", default: 0
  end

  create_table "users", force: :cascade do |t|
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
    t.integer "roles_mask", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider"
    t.string "uid"
    t.integer "league_id"
    t.string "favourite_team"
    t.string "username"
    t.integer "budget", default: 500
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
