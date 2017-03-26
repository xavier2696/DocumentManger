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

ActiveRecord::Schema.define(version: 20170326182106) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "archives", force: :cascade do |t|
    t.integer  "document_id"
    t.string   "archive"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["document_id"], name: "index_archives_on_document_id", using: :btree
  end

  create_table "departments", force: :cascade do |t|
    t.string   "departmentName"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "documents", force: :cascade do |t|
    t.string   "documentCode"
    t.string   "subject"
    t.date     "date"
    t.text     "content"
    t.string   "tags"
    t.integer  "conversationId"
    t.boolean  "isSenderPrivate"
    t.boolean  "isReceiverPrivate"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "sender_id"
    t.integer  "receiver_id"
    t.integer  "creator_id"
    t.integer  "senderStatus_id"
    t.integer  "receiverStatus_id"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.string   "picture"
    t.index ["creator_id"], name: "index_documents_on_creator_id", using: :btree
    t.index ["receiverStatus_id"], name: "index_documents_on_receiverStatus_id", using: :btree
    t.index ["receiver_id"], name: "index_documents_on_receiver_id", using: :btree
    t.index ["senderStatus_id"], name: "index_documents_on_senderStatus_id", using: :btree
    t.index ["sender_id"], name: "index_documents_on_sender_id", using: :btree
  end

  create_table "documents_tags", id: false, force: :cascade do |t|
    t.integer "tag_id",      null: false
    t.integer "document_id", null: false
  end

  create_table "images", force: :cascade do |t|
    t.string   "imageUrl"
    t.integer  "document_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["document_id"], name: "index_images_on_document_id", using: :btree
  end

  create_table "statuses", force: :cascade do |t|
    t.string   "description"
    t.integer  "department_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["department_id"], name: "index_statuses_on_department_id", using: :btree
  end

  create_table "tags", force: :cascade do |t|
    t.string   "tagName"
    t.integer  "department_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password"
    t.string   "username"
    t.integer  "department_id",                       null: false
    t.string   "position"
    t.boolean  "isGeneralAdmin"
    t.boolean  "isDepartmentAdmin"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.index ["department_id"], name: "index_users_on_department_id", using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "archives", "documents"
  add_foreign_key "documents", "statuses", column: "receiverStatus_id"
  add_foreign_key "documents", "statuses", column: "senderStatus_id"
  add_foreign_key "documents", "users", column: "creator_id"
  add_foreign_key "documents", "users", column: "receiver_id"
  add_foreign_key "documents", "users", column: "sender_id"
  add_foreign_key "images", "documents"
  add_foreign_key "statuses", "departments"
  add_foreign_key "users", "departments"
end
