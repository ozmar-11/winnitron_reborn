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

ActiveRecord::Schema.define(version: 20180219004003) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "api_keys", id: :serial, force: :cascade do |t|
    t.integer "arcade_machine_id"
    t.string "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["arcade_machine_id"], name: "index_api_keys_on_arcade_machine_id"
    t.index ["token"], name: "index_api_keys_on_token"
  end

  create_table "approval_requests", id: :serial, force: :cascade do |t|
    t.integer "approvable_id"
    t.string "approvable_type"
    t.text "notes"
    t.datetime "approved_at"
    t.datetime "refused_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "arcade_machines", id: :serial, force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.text "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.integer "players"
    t.float "latitude"
    t.float "longitude"
    t.boolean "mappable", default: true
  end

  create_table "comments", id: :serial, force: :cascade do |t|
    t.string "title", limit: 50, default: ""
    t.text "comment"
    t.integer "commentable_id"
    t.string "commentable_type"
    t.integer "user_id"
    t.string "role", default: "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["commentable_id"], name: "index_comments_on_commentable_id"
    t.index ["commentable_type"], name: "index_comments_on_commentable_type"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "game_ownerships", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "game_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_game_ownerships_on_game_id"
    t.index ["user_id"], name: "index_game_ownerships_on_user_id"
  end

  create_table "game_zips", id: :serial, force: :cascade do |t|
    t.integer "game_id"
    t.string "file_key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.datetime "file_last_modified"
    t.string "executable"
  end

  create_table "games", id: :serial, force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "min_players"
    t.integer "max_players"
    t.string "slug"
    t.datetime "published_at"
    t.index ["published_at"], name: "index_games_on_published_at"
  end

  create_table "images", id: :serial, force: :cascade do |t|
    t.integer "parent_id"
    t.string "parent_type"
    t.string "file_key"
    t.datetime "file_last_modified"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.boolean "cover", default: false
    t.index ["parent_type", "parent_id"], name: "index_images_on_parent_type_and_parent_id"
    t.index ["user_id"], name: "index_images_on_user_id"
  end

  create_table "key_maps", id: :serial, force: :cascade do |t|
    t.integer "game_id"
    t.integer "template", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.json "custom_map"
  end

  create_table "links", id: :serial, force: :cascade do |t|
    t.integer "parent_id"
    t.string "parent_type"
    t.string "url"
    t.string "link_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parent_type", "parent_id"], name: "index_links_on_parent_type_and_parent_id"
  end

  create_table "listings", id: :serial, force: :cascade do |t|
    t.integer "game_id"
    t.integer "playlist_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_listings_on_game_id"
    t.index ["playlist_id"], name: "index_listings_on_playlist_id"
  end

  create_table "locations", id: :serial, force: :cascade do |t|
    t.integer "parent_id"
    t.string "parent_type"
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "country"
    t.float "latitude"
    t.float "longitude"
  end

  create_table "logged_events", id: :serial, force: :cascade do |t|
    t.integer "actor_id"
    t.string "actor_type"
    t.json "details"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["actor_type", "actor_id"], name: "index_logged_events_on_actor_type_and_actor_id"
  end

  create_table "machine_ownerships", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "arcade_machine_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["arcade_machine_id"], name: "index_machine_ownerships_on_arcade_machine_id"
    t.index ["user_id"], name: "index_machine_ownerships_on_user_id"
  end

  create_table "playlists", id: :serial, force: :cascade do |t|
    t.string "title"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "default", default: false
    t.text "description"
    t.string "slug"
    t.index ["user_id"], name: "index_playlists_on_user_id"
  end

  create_table "plays", id: :serial, force: :cascade do |t|
    t.integer "arcade_machine_id"
    t.integer "game_id"
    t.datetime "start"
    t.datetime "stop"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subscriptions", id: :serial, force: :cascade do |t|
    t.integer "arcade_machine_id"
    t.integer "playlist_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "taggings", id: :serial, force: :cascade do |t|
    t.integer "tag_id"
    t.integer "taggable_id"
    t.string "taggable_type"
    t.integer "tagger_id"
    t.string "tagger_type"
    t.string "context", limit: 128
    t.datetime "created_at"
    t.index ["context"], name: "index_taggings_on_context"
    t.index ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
    t.index ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context"
    t.index ["taggable_id", "taggable_type", "tagger_id", "context"], name: "taggings_idy"
    t.index ["taggable_id"], name: "index_taggings_on_taggable_id"
    t.index ["taggable_type"], name: "index_taggings_on_taggable_type"
    t.index ["tagger_id", "tagger_type"], name: "index_taggings_on_tagger_id_and_tagger_type"
    t.index ["tagger_id"], name: "index_taggings_on_tagger_id"
  end

  create_table "tags", id: :serial, force: :cascade do |t|
    t.string "name"
    t.integer "taggings_count", default: 0
    t.index ["name"], name: "index_tags_on_name", unique: true
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.boolean "admin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "provider"
    t.string "uid"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
