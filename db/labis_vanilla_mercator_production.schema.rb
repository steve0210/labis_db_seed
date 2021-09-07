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

ActiveRecord::Schema.define(version: 20110527142454) do

  create_table "accounts", force: :cascade do |t|
    t.string   "description",   limit: 255
    t.string   "tps_id",        limit: 36
    t.integer  "lab_is_id",     limit: 4
    t.integer  "web_portal_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "body_sites", force: :cascade do |t|
    t.string  "description",   limit: 255
    t.string  "tps_id",        limit: 36
    t.integer "lab_is_id",     limit: 4
    t.integer "web_portal_id", limit: 4
  end

  add_index "body_sites", ["lab_is_id"], name: "index_body_sites_on_lab_is_id", using: :btree
  add_index "body_sites", ["tps_id"], name: "index_body_sites_on_tps_id", using: :btree
  add_index "body_sites", ["web_portal_id"], name: "index_body_sites_on_web_portal_id", using: :btree

  create_table "case_order_specimens", force: :cascade do |t|
    t.integer  "case_order_id",      limit: 4
    t.integer  "lab_is_specimen_id", limit: 4
    t.string   "tps_specimen_id",    limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "case_orders", force: :cascade do |t|
    t.string   "tps_case_id",         limit: 36
    t.integer  "lab_is_case_id",      limit: 4
    t.string   "lab_is_order_number", limit: 255
    t.boolean  "is_processed"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_tc"
  end

  create_table "case_types", force: :cascade do |t|
    t.string  "description",   limit: 255
    t.string  "tps_id",        limit: 36
    t.integer "lab_is_id",     limit: 4
    t.integer "web_portal_id", limit: 4
  end

  add_index "case_types", ["lab_is_id"], name: "index_case_types_on_lab_is_id", using: :btree
  add_index "case_types", ["tps_id"], name: "index_case_types_on_tps_id", using: :btree
  add_index "case_types", ["web_portal_id"], name: "index_case_types_on_web_portal_id", using: :btree

  create_table "cassette_colors", force: :cascade do |t|
    t.string  "tps_description",          limit: 255
    t.integer "lab_is_cassette_color_id", limit: 4
  end

  create_table "cbc_measurements", force: :cascade do |t|
    t.string  "description",   limit: 255
    t.string  "tps_id",        limit: 36
    t.integer "lab_is_id",     limit: 4
    t.integer "web_portal_id", limit: 4
  end

  create_table "control_code_types", force: :cascade do |t|
    t.string  "description",   limit: 255
    t.string  "tps_id",        limit: 36
    t.integer "lab_is_id",     limit: 4
    t.integer "web_portal_id", limit: 4
  end

  add_index "control_code_types", ["lab_is_id"], name: "index_control_code_types_on_lab_is_id", using: :btree
  add_index "control_code_types", ["tps_id"], name: "index_control_code_types_on_tps_id", using: :btree
  add_index "control_code_types", ["web_portal_id"], name: "index_control_code_types_on_web_portal_id", using: :btree

  create_table "dx_classifications", force: :cascade do |t|
    t.string  "description",   limit: 255
    t.string  "tps_id",        limit: 36
    t.integer "lab_is_id",     limit: 4
    t.integer "web_portal_id", limit: 4
  end

  add_index "dx_classifications", ["lab_is_id"], name: "index_dx_classifications_on_lab_is_id", using: :btree
  add_index "dx_classifications", ["tps_id"], name: "index_dx_classifications_on_tps_id", using: :btree
  add_index "dx_classifications", ["web_portal_id"], name: "index_dx_classifications_on_web_portal_id", using: :btree

  create_table "dx_sub_classifications", force: :cascade do |t|
    t.string  "description",   limit: 255
    t.string  "tps_id",        limit: 36
    t.integer "lab_is_id",     limit: 4
    t.integer "web_portal_id", limit: 4
  end

  add_index "dx_sub_classifications", ["lab_is_id"], name: "index_dx_sub_classifications_on_lab_is_id", using: :btree
  add_index "dx_sub_classifications", ["tps_id"], name: "index_dx_sub_classifications_on_tps_id", using: :btree
  add_index "dx_sub_classifications", ["web_portal_id"], name: "index_dx_sub_classifications_on_web_portal_id", using: :btree

  create_table "export_cases", force: :cascade do |t|
    t.string   "description",   limit: 255
    t.string   "tps_id",        limit: 36
    t.integer  "lab_is_id",     limit: 4
    t.integer  "web_portal_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "export_order_results", force: :cascade do |t|
    t.string   "tps_case_id",     limit: 255
    t.boolean  "is_delivered"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "number_of_tries", limit: 4
    t.text     "error",           limit: 65535
  end

  create_table "flow_intensities", force: :cascade do |t|
    t.string  "description",   limit: 255
    t.string  "tps_id",        limit: 36
    t.integer "lab_is_id",     limit: 4
    t.integer "web_portal_id", limit: 4
  end

  create_table "flow_marker_types", force: :cascade do |t|
    t.string  "description",   limit: 255
    t.string  "tps_id",        limit: 255
    t.integer "lab_is_id",     limit: 4
    t.integer "web_portal_id", limit: 4
  end

  create_table "flow_markers", force: :cascade do |t|
    t.string  "description",   limit: 255
    t.string  "tps_id",        limit: 36
    t.integer "lab_is_id",     limit: 4
    t.integer "web_portal_id", limit: 4
  end

  create_table "flow_specimen_panel_units", force: :cascade do |t|
    t.string  "tps_case_id",       limit: 255
    t.string  "tps_specimen_id",   limit: 255
    t.integer "units",             limit: 4,   null: false
    t.integer "labis_case_id",     limit: 4
    t.integer "labis_specimen_id", limit: 4
  end

  create_table "heme_descriptions", force: :cascade do |t|
    t.string  "description",   limit: 255
    t.string  "tps_id",        limit: 36
    t.integer "lab_is_id",     limit: 4
    t.integer "web_portal_id", limit: 4
  end

  create_table "heme_differentials", force: :cascade do |t|
    t.string  "description",   limit: 255
    t.string  "tps_id",        limit: 36
    t.integer "lab_is_id",     limit: 4
    t.integer "web_portal_id", limit: 4
  end

  create_table "heme_interpretation_tests", force: :cascade do |t|
    t.string  "tps_interpretation_test_id", limit: 255, null: false
    t.integer "min",                        limit: 4,   null: false
    t.integer "max",                        limit: 4,   null: false
  end

  create_table "heme_panel_exceptions", force: :cascade do |t|
    t.string  "tps_heme_panel_exception_id", limit: 255, null: false
    t.integer "is_exception",                limit: 1,   null: false
  end

  create_table "ihc_specimen_transports", force: :cascade do |t|
    t.integer  "labis_ihc_transport_id", limit: 4
    t.string   "tps_ihc_transport_id",   limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ihc_specimen_types", force: :cascade do |t|
    t.integer  "labis_ihc_specimen_type_id", limit: 4
    t.string   "tps_ihc_specimen_type_id",   limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "image_types", force: :cascade do |t|
    t.string   "tps_id",     limit: 255
    t.string   "labis_id",   limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locations", force: :cascade do |t|
    t.string   "description",   limit: 255
    t.string   "tps_id",        limit: 36
    t.integer  "lab_is_id",     limit: 4
    t.integer  "web_portal_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "marital_statuses", force: :cascade do |t|
    t.string  "description",   limit: 255
    t.string  "tps_id",        limit: 36
    t.integer "lab_is_id",     limit: 4
    t.integer "web_portal_id", limit: 4
  end

  add_index "marital_statuses", ["lab_is_id"], name: "index_marital_statuses_on_lab_is_id", using: :btree
  add_index "marital_statuses", ["tps_id"], name: "index_marital_statuses_on_tps_id", using: :btree
  add_index "marital_statuses", ["web_portal_id"], name: "index_marital_statuses_on_web_portal_id", using: :btree

  create_table "order_test_map", force: :cascade do |t|
    t.string  "tps_specimen_id",   limit: 255, null: false
    t.integer "labis_specimen_id", limit: 4,   null: false
    t.string  "tps_test_id",       limit: 255, null: false
    t.integer "labis_test_id",     limit: 4,   null: false
  end

  create_table "patients", force: :cascade do |t|
    t.string   "description",   limit: 255
    t.string   "tps_id",        limit: 36
    t.integer  "lab_is_id",     limit: 4
    t.integer  "web_portal_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pc_tests", force: :cascade do |t|
    t.string   "lab_is_test_id", limit: 255
    t.string   "tps_test_id",    limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "physicians", force: :cascade do |t|
    t.string   "description",   limit: 255
    t.string   "tps_id",        limit: 36
    t.integer  "lab_is_id",     limit: 4
    t.integer  "web_portal_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "priorities", force: :cascade do |t|
    t.string  "description",   limit: 255
    t.string  "tps_id",        limit: 255
    t.integer "lab_is_id",     limit: 4
    t.integer "web_portal_id", limit: 4
  end

  create_table "race_types", force: :cascade do |t|
    t.string  "description",   limit: 255
    t.string  "tps_id",        limit: 36
    t.integer "lab_is_id",     limit: 4
    t.integer "web_portal_id", limit: 4
  end

  add_index "race_types", ["lab_is_id"], name: "index_race_types_on_lab_is_id", using: :btree
  add_index "race_types", ["tps_id"], name: "index_race_types_on_tps_id", using: :btree
  add_index "race_types", ["web_portal_id"], name: "index_race_types_on_web_portal_id", using: :btree

  create_table "referred_cases", force: :cascade do |t|
    t.string   "tps_case_id",   limit: 255
    t.integer  "labis_case_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "regate_orders", force: :cascade do |t|
    t.integer  "lab_is_specimen_id",       limit: 4
    t.string   "tps_clinical_activity_id", limit: 255
    t.integer  "lab_is_external_order_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "regated_images", force: :cascade do |t|
    t.integer "labis_specimen_id", limit: 4,   null: false
    t.string  "tps_image_id",      limit: 255, null: false
    t.integer "regate_order_id",   limit: 4
  end

  add_index "regated_images", ["regate_order_id"], name: "regate_order_id", using: :btree

  create_table "regated_markers", force: :cascade do |t|
    t.integer "labis_specimen_id",                  limit: 4,   null: false
    t.string  "tps_flow_specimen_marker_result_id", limit: 255, null: false
    t.integer "regate_order_id",                    limit: 4
  end

  add_index "regated_markers", ["regate_order_id"], name: "regate_order_id", using: :btree

  create_table "specialties", force: :cascade do |t|
    t.string  "description",   limit: 255
    t.string  "tps_id",        limit: 36
    t.integer "lab_is_id",     limit: 4
    t.integer "web_portal_id", limit: 4
  end

  add_index "specialties", ["lab_is_id"], name: "index_specialties_on_lab_is_id", using: :btree
  add_index "specialties", ["tps_id"], name: "index_specialties_on_tps_id", using: :btree
  add_index "specialties", ["web_portal_id"], name: "index_specialties_on_web_portal_id", using: :btree

  create_table "specimen_tests", force: :cascade do |t|
    t.string  "description",   limit: 255
    t.string  "tps_id",        limit: 36
    t.integer "lab_is_id",     limit: 4
    t.integer "web_portal_id", limit: 4
  end

  create_table "specimen_types", force: :cascade do |t|
    t.string  "description",   limit: 255
    t.string  "tps_id",        limit: 36
    t.integer "lab_is_id",     limit: 4
    t.integer "web_portal_id", limit: 4
  end

  add_index "specimen_types", ["lab_is_id"], name: "index_specimen_types_on_lab_is_id", using: :btree
  add_index "specimen_types", ["tps_id"], name: "index_specimen_types_on_tps_id", using: :btree
  add_index "specimen_types", ["web_portal_id"], name: "index_specimen_types_on_web_portal_id", using: :btree

  create_table "specimens", force: :cascade do |t|
    t.string   "description",   limit: 255
    t.string   "tps_id",        limit: 36
    t.integer  "lab_is_id",     limit: 4
    t.integer  "web_portal_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tc_accounts", force: :cascade do |t|
    t.string   "tps_account_id",           limit: 255
    t.integer  "lab_is_account_id",        limit: 4
    t.integer  "lab_is_client_account_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tc_case_types", force: :cascade do |t|
    t.string  "tps_id",    limit: 36
    t.integer "lab_is_id", limit: 4
  end

  add_index "tc_case_types", ["lab_is_id"], name: "index_tc_case_types_on_lab_is_id", using: :btree
  add_index "tc_case_types", ["tps_id"], name: "index_tc_case_types_on_tps_id", using: :btree

  create_table "tc_client_account_physicians", force: :cascade do |t|
    t.integer  "client_account_physician_id", limit: 4
    t.string   "tps_physician_id",            limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "account_id",                  limit: 4
  end

  create_table "tc_linkings", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tc_locations", force: :cascade do |t|
    t.string   "tps_location_id",                   limit: 255
    t.integer  "lab_is_client_account_location_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tc_specimen_types", force: :cascade do |t|
    t.string  "tps_specimen_type_id",    limit: 255
    t.integer "lab_is_specimen_type_id", limit: 4
  end

  create_table "tc_tests", force: :cascade do |t|
    t.string   "tps_test_id",    limit: 255
    t.string   "lab_is_test_id", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
