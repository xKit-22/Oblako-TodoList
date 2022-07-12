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

ActiveRecord::Schema[7.0].define(version: 2022_07_11_200012) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "btree_gin"
  enable_extension "btree_gist"
  enable_extension "citext"
  enable_extension "cube"
  enable_extension "dblink"
  enable_extension "dict_int"
  enable_extension "dict_xsyn"
  enable_extension "earthdistance"
  enable_extension "fuzzystrmatch"
  enable_extension "hstore"
  enable_extension "intarray"
  enable_extension "ltree"
  enable_extension "pg_stat_statements"
  enable_extension "pg_trgm"
  enable_extension "pgcrypto"
  enable_extension "pgrowlocks"
  enable_extension "pgstattuple"
  enable_extension "plpgsql"
  enable_extension "tablefunc"
  enable_extension "unaccent"
  enable_extension "uuid-ossp"
  enable_extension "xml2"

  create_table "comment", id: { type: :string, limit: 20 }, force: :cascade do |t|
    t.string "postId", null: false
    t.string "text", null: false
    t.integer "likesAmount", null: false
    t.string "authorId", null: false
    t.string "dateOfCreation", null: false
    t.string "userId", limit: 20
  end

  create_table "post", id: { type: :string, limit: 20 }, force: :cascade do |t|
    t.string "text", null: false
    t.string "picture", null: false
    t.integer "likesAmount", null: false
    t.string "authorId", null: false
    t.string "dateOfCreation", null: false
    t.string "userId", limit: 20
  end

  create_table "projects", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subscription", id: { type: :string, limit: 20 }, force: :cascade do |t|
    t.string "subscriberId", null: false
    t.string "whoAreSubscribedToId", null: false
  end

  create_table "todos", force: :cascade do |t|
    t.string "text"
    t.boolean "isCompleted"
    t.bigint "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_todos_on_project_id"
  end

  create_table "users", id: { type: :string, limit: 20 }, force: :cascade do |t|
    t.string "nickname", null: false
    t.string "avatar", null: false
    t.integer "postsAmount", null: false
    t.integer "subscribersAmount", null: false
    t.integer "subscriptionsAmount", null: false
    t.integer "allLikesAmount", null: false
    t.string "dateOfCreation", null: false
    t.string "userLogin", null: false
    t.string "userPassword", null: false
    t.jsonb "likedPosts", null: false
  end

  create_table "users_subscriptions_users", primary_key: ["usersId_1", "usersId_2"], force: :cascade do |t|
    t.string "usersId_1", limit: 20, null: false
    t.string "usersId_2", limit: 20, null: false
    t.index ["usersId_1"], name: "IDX_eb8ca7bf7cf5137dd618ca75e6"
    t.index ["usersId_2"], name: "IDX_0204b0dfc5fe89343b87f17df5"
  end

  create_table "users_user_users", primary_key: ["usersId_1", "usersId_2"], force: :cascade do |t|
    t.string "usersId_1", limit: 20, null: false
    t.string "usersId_2", limit: 20, null: false
    t.index ["usersId_1"], name: "IDX_eb976bc4cf5f5ad23a6fcc2ba0"
    t.index ["usersId_2"], name: "IDX_f5c5a84321a8f11615b064bc8a"
  end

  add_foreign_key "comment", "post", column: "postId", name: "FK_94a85bb16d24033a2afdd5df060", on_delete: :cascade
  add_foreign_key "comment", "users", column: "userId", name: "FK_c0354a9a009d3bb45a08655ce3b"
  add_foreign_key "post", "users", column: "userId", name: "FK_5c1cf55c308037b5aca1038a131"
  add_foreign_key "todos", "projects"
  add_foreign_key "users_subscriptions_users", "users", column: "usersId_1", name: "FK_eb8ca7bf7cf5137dd618ca75e6d", on_update: :cascade, on_delete: :cascade
  add_foreign_key "users_subscriptions_users", "users", column: "usersId_2", name: "FK_0204b0dfc5fe89343b87f17df5d", on_update: :cascade, on_delete: :cascade
  add_foreign_key "users_user_users", "users", column: "usersId_1", name: "FK_eb976bc4cf5f5ad23a6fcc2ba0e", on_update: :cascade, on_delete: :cascade
  add_foreign_key "users_user_users", "users", column: "usersId_2", name: "FK_f5c5a84321a8f11615b064bc8a5", on_update: :cascade, on_delete: :cascade
end
