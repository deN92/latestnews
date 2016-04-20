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

ActiveRecord::Schema.define(version: 20160420100816) do

  create_table "articles", force: :cascade do |t|
    t.integer  "subcategory_id",  limit: 3,                   null: false
    t.string   "tittle",          limit: 150,                 null: false
    t.string   "article_link",    limit: 150,                 null: false
    t.string   "body",            limit: 150,                 null: false
    t.string   "main_image",      limit: 150
    t.boolean  "enable_comments",             default: false
    t.boolean  "main_article",                default: false
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "category_name", limit: 50, null: false
    t.string   "category_link", limit: 20, null: false
    t.integer  "priority",      limit: 2,  null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "subcategories", force: :cascade do |t|
    t.integer  "category_id",      limit: 3,  null: false
    t.string   "subcategory_name", limit: 50, null: false
    t.string   "subcategory_link", limit: 20, null: false
    t.integer  "priority",         limit: 2,  null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

end
