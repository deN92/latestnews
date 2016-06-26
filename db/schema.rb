# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160612132633) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace",     limit: 255
    t.text     "body",          limit: 65535
    t.string   "resource_id",   limit: 255,   null: false
    t.string   "resource_type", limit: 255,   null: false
    t.integer  "author_id",     limit: 4
    t.string   "author_type",   limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "article_images", force: :cascade do |t|
    t.string   "article_imgs", limit: 250
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "articles", force: :cascade do |t|
    t.integer  "category_id",     limit: 3,                   null: false
    t.integer  "subcategory_id",  limit: 3,                   null: false
    t.integer  "region_id",       limit: 3,                   null: false
    t.string   "tittle",          limit: 150,                 null: false
    t.string   "article_link",    limit: 150,                 null: false
    t.string   "body",            limit: 150,                 null: false
    t.string   "main_image",      limit: 150
    t.boolean  "enable_comments",             default: true
    t.integer  "count_comments",  limit: 8
    t.boolean  "main_article",                default: false
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

  add_index "articles", ["article_link"], name: "index_articles_on_article_link", using: :btree

  create_table "blogs", force: :cascade do |t|
    t.integer  "user_id",        limit: 4
    t.integer  "category_id",    limit: 4
    t.string   "post_title",     limit: 255
    t.string   "post_theme",     limit: 255
    t.string   "post_body",      limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "count_comments", limit: 4
  end

  create_table "categories", force: :cascade do |t|
    t.string   "category_name", limit: 50,                null: false
    t.string   "category_link", limit: 20,                null: false
    t.integer  "priority",      limit: 2,                 null: false
    t.boolean  "menu_show",                default: true
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  create_table "catsubcategories", force: :cascade do |t|
    t.integer  "category_id",    limit: 3,                null: false
    t.integer  "subcategory_id", limit: 3,                null: false
    t.boolean  "menu_show",                default: true
    t.integer  "priority",       limit: 4, default: 1
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "user_id",             limit: 4
    t.integer  "article_id",          limit: 4
    t.integer  "blog_id",             limit: 4
    t.string   "body",                limit: 255
    t.integer  "count_votes_like",    limit: 4,   default: 0
    t.integer  "count_votes_dislike", limit: 4,   default: 0
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

  create_table "regions", force: :cascade do |t|
    t.string   "region_name", limit: 20, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "stats_users_signs", force: :cascade do |t|
    t.date    "date_sign_in",            default: '2016-05-25', null: false
    t.integer "count_sign_in", limit: 4, default: 0,            null: false
  end

  create_table "subcategories", force: :cascade do |t|
    t.string   "subcategory_name", limit: 50, null: false
    t.string   "subcategory_link", limit: 20, null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "",    null: false
    t.string   "encrypted_password",     limit: 255, default: "",    null: false
    t.string   "surname",                limit: 40
    t.string   "name",                   limit: 40
    t.string   "middle_name",            limit: 40
    t.date     "birthday"
    t.string   "city",                   limit: 40
    t.string   "photo",                  limit: 255
    t.integer  "count_posts",            limit: 8
    t.boolean  "is_admin",                           default: false
    t.boolean  "is_ban",                             default: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "votes", force: :cascade do |t|
    t.integer  "votable_id",   limit: 4
    t.string   "votable_type", limit: 255
    t.integer  "voter_id",     limit: 4
    t.string   "voter_type",   limit: 255
    t.boolean  "vote_flag"
    t.string   "vote_scope",   limit: 255
    t.integer  "vote_weight",  limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope", using: :btree
  add_index "votes", ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope", using: :btree

end
