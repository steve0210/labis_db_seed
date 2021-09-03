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

ActiveRecord::Schema.define(version: 20160406210704) do

  create_table "account_preferences", force: :cascade do |t|
    t.integer  "account_id",                           limit: 4
    t.boolean  "pin_required",                                       default: true
    t.integer  "last_updated_by",                      limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slide_label_format",                   limit: 255
    t.integer  "slides_per_block",                     limit: 4,     default: 1
    t.boolean  "cassette_print"
    t.boolean  "client_delivery"
    t.boolean  "global_delivery"
    t.boolean  "skip_patient_insurance"
    t.string   "local_report_library",                 limit: 255
    t.integer  "require_external_system_id",           limit: 4
    t.boolean  "prompt_lab_location_select"
    t.boolean  "enable_order_updates"
    t.boolean  "enable_adt_demographic_updates"
    t.boolean  "enable_patient_history"
    t.boolean  "enable_billing_interface"
    t.string   "billing_web_service_url",              limit: 255
    t.string   "billing_destination",                  limit: 255
    t.boolean  "disable_payer_requirement"
    t.string   "adt_update_url",                       limit: 255
    t.string   "specimen_label_format",                limit: 255
    t.string   "organizational_name",                  limit: 255
    t.string   "location_name_report",                 limit: 255
    t.boolean  "client_suffix"
    t.boolean  "include_referral_results"
    t.boolean  "include_location_phone_number"
    t.boolean  "enable_fcs_import_service"
    t.string   "fcs_import_service_url",               limit: 255
    t.boolean  "bodysite_before_specimen_type"
    t.string   "slide_printing_order",                 limit: 255
    t.boolean  "use_labis_case_number"
    t.integer  "pap_history_term",                     limit: 4
    t.text     "pap_report_disclaimer",                limit: 65535
    t.boolean  "use_incoming_patient_id",                            default: false
    t.boolean  "enable_sceris_service",                              default: false
    t.string   "sceris_service_drawer",                limit: 255
    t.boolean  "enable_requisition_number_validation"
    t.boolean  "display_misys_number",                               default: false
    t.string   "external_case_number_label",           limit: 255
    t.boolean  "use_demographics_from_eorder",                       default: false
    t.boolean  "enable_eorders_interface"
    t.string   "authentication_method",                limit: 255
    t.string   "primary_ldap_ip",                      limit: 255
    t.string   "secondary_ldap_ip",                    limit: 255
    t.string   "authentication_domain",                limit: 255
  end

  add_index "account_preferences", ["enable_eorders_interface"], name: "index_account_preferences_on_enable_eorders_interface", using: :btree

  create_table "accounts", force: :cascade do |t|
    t.string   "account_name",        limit: 255
    t.string   "first_name",          limit: 255
    t.string   "middle_initial",      limit: 255
    t.string   "last_name",           limit: 255
    t.string   "email",               limit: 255
    t.string   "phone",               limit: 10
    t.boolean  "active",                          default: true
    t.integer  "client_account_seed", limit: 4,   default: 1
    t.string   "lab_tat",             limit: 255, default: "1;Day(s)"
    t.string   "pathology_tat",       limit: 255, default: "1;Day(s)"
    t.string   "billing_tat",         limit: 255, default: "1;Day(s)"
    t.integer  "location_seed",       limit: 4,   default: 1
    t.string   "tps_id",              limit: 36
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "accounts_case_types", force: :cascade do |t|
    t.integer "account_id",   limit: 4, null: false
    t.integer "case_type_id", limit: 4, null: false
    t.integer "case_labels",  limit: 4
  end

  add_index "accounts_case_types", ["account_id", "case_type_id"], name: "index_accounts_case_types_on_account_id_and_case_type_id", using: :btree

  create_table "accounts_delivery_methods", id: false, force: :cascade do |t|
    t.integer "account_id",         limit: 4, null: false
    t.integer "delivery_method_id", limit: 4, null: false
  end

  add_index "accounts_delivery_methods", ["account_id", "delivery_method_id"], name: "adm_account_id_dm_id_ix", using: :btree

  create_table "additional_studies", force: :cascade do |t|
    t.integer  "specimen_id",               limit: 4,                   null: false
    t.integer  "additional_study_order_id", limit: 4,                   null: false
    t.integer  "specimen_test_id",          limit: 4,                   null: false
    t.string   "block",                     limit: 255
    t.integer  "units",                     limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "added_to_billing",                      default: false
  end

  add_index "additional_studies", ["additional_study_order_id"], name: "index_additional_studies_on_additional_study_order_id", using: :btree
  add_index "additional_studies", ["specimen_id"], name: "index_additional_studies_on_specimen_id", using: :btree
  add_index "additional_studies", ["specimen_test_id"], name: "index_additional_studies_on_specimen_test_id", using: :btree

  create_table "additional_study_order_results", force: :cascade do |t|
    t.integer  "additional_study_order_id", limit: 4
    t.string   "document",                  limit: 255
    t.boolean  "include_on_final_report",                      default: false
    t.boolean  "viewed",                                       default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "result_text",               limit: 4294967295
    t.boolean  "active",                                       default: true
    t.string   "cap",                       limit: 255
    t.string   "clia",                      limit: 255
    t.string   "diagnosis_summary",         limit: 255
  end

  add_index "additional_study_order_results", ["additional_study_order_id"], name: "additional_study_order_index", using: :btree

  create_table "additional_study_order_tests", force: :cascade do |t|
    t.integer  "additional_study_order_id", limit: 4
    t.integer  "specimen_test_id",          limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "dyk_suggestion",                      default: false
  end

  add_index "additional_study_order_tests", ["additional_study_order_id"], name: "index_additional_study_order_tests_on_additional_study_order_id", using: :btree

  create_table "additional_study_orders", force: :cascade do |t|
    t.integer  "case_id",                       limit: 4,                    null: false
    t.integer  "user_id",                       limit: 4
    t.integer  "account_id",                    limit: 4
    t.integer  "priority_id",                   limit: 4
    t.text     "comments",                      limit: 65535
    t.string   "billing_option",                limit: 255
    t.string   "last_step",                     limit: 1
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "order_type",                    limit: 10
    t.boolean  "sending_material",                            default: true
    t.integer  "condition_id",                  limit: 4
    t.string   "tps_case_type_id",              limit: 255
    t.string   "cblpath_case_reference_number", limit: 255
    t.integer  "number_of_slides",              limit: 4
    t.integer  "number_of_blocks",              limit: 4
    t.integer  "sending_other",                 limit: 4
    t.boolean  "request_digital_slides"
    t.string   "diagnosis_under_consideration", limit: 255
    t.string   "recon_id",                      limit: 255
  end

  add_index "additional_study_orders", ["account_id"], name: "index_additional_study_orders_on_account_id", using: :btree
  add_index "additional_study_orders", ["case_id"], name: "index_additional_study_orders_on_case_id", using: :btree

  create_table "amendment_reasons", force: :cascade do |t|
    t.string   "description", limit: 255
    t.integer  "account_id",  limit: 4
    t.boolean  "active",                  default: true
    t.boolean  "default"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "amendment_reasons", ["account_id"], name: "index_amendment_reasons_on_account_id", using: :btree

  create_table "amendment_reasons_cases", id: false, force: :cascade do |t|
    t.integer "case_id",             limit: 4
    t.integer "amendment_reason_id", limit: 4
  end

  add_index "amendment_reasons_cases", ["case_id", "amendment_reason_id"], name: "index_amendment_reasons_cases_on_case_id_and_amendment_reason_id", using: :btree

  create_table "answers", force: :cascade do |t|
    t.string   "answerable_type", limit: 255
    t.integer  "answerable_id",   limit: 4
    t.text     "answer_text",     limit: 65535
    t.integer  "question_id",     limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "answers", ["answerable_id", "answerable_type"], name: "index_answers_on_answerable_id_and_answerable_type", using: :btree
  add_index "answers", ["question_id"], name: "index_answers_on_question_id", using: :btree

  create_table "antibodies", force: :cascade do |t|
    t.string   "description",      limit: 255
    t.string   "test_clone",       limit: 255
    t.boolean  "is_positive_bad"
    t.string   "abbreviation",     limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "specimen_test_id", limit: 4
  end

  create_table "billing_insurances", force: :cascade do |t|
    t.integer  "patient_id",           limit: 4,   null: false
    t.integer  "case_billing_id",      limit: 4,   null: false
    t.string   "company_name",         limit: 100
    t.string   "insured_name",         limit: 100
    t.string   "insured_dob",          limit: 50
    t.string   "relationship",         limit: 50
    t.string   "address_one",          limit: 200
    t.string   "address_two",          limit: 200
    t.string   "city",                 limit: 100
    t.string   "state",                limit: 2
    t.string   "zip",                  limit: 10
    t.string   "member_id",            limit: 50
    t.string   "group_number",         limit: 50
    t.string   "employer",             limit: 100
    t.string   "authorization_number", limit: 50
    t.string   "insurance_level",      limit: 255
    t.string   "phone",                limit: 10
    t.string   "insured_ssn",          limit: 11
    t.string   "plan_number",          limit: 50
    t.string   "insurance_code",       limit: 50
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "billing_insurances", ["case_billing_id"], name: "index_billing_insurances_on_case_billing_id", using: :btree

  create_table "body_site_specimen_maps", force: :cascade do |t|
    t.string   "map_id",       limit: 255
    t.integer  "coordinate_x", limit: 4
    t.integer  "coordinate_y", limit: 4
    t.integer  "body_site_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "body_sites", force: :cascade do |t|
    t.string   "description", limit: 255
    t.string   "malignant",   limit: 255
    t.string   "benign",      limit: 255
    t.string   "unspecified", limit: 255
    t.string   "insitu",      limit: 255
    t.string   "tps_id",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "account_id",  limit: 4
  end

  add_index "body_sites", ["account_id"], name: "index_body_sites_on_account_id", using: :btree

  create_table "body_sites_specimen_types", force: :cascade do |t|
    t.integer "body_site_id",     limit: 4, null: false
    t.integer "specimen_type_id", limit: 4, null: false
    t.integer "case_type_id",     limit: 4
  end

  add_index "body_sites_specimen_types", ["specimen_type_id", "body_site_id"], name: "bs_st_st_id_bs_id_ix", using: :btree

  create_table "bolt_on_types", force: :cascade do |t|
    t.string   "description", limit: 255
    t.boolean  "is_required"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bolton_sort_orders", force: :cascade do |t|
    t.integer  "case_type_id",   limit: 4
    t.integer  "bolton_type_id", limit: 4
    t.integer  "sort_order",     limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "breathtek_grossing_options", force: :cascade do |t|
    t.integer  "number_of_slides", limit: 4
    t.string   "weight",           limit: 255
    t.string   "cO2",              limit: 255
    t.string   "conclusion",       limit: 255
    t.integer  "specimen_id",      limit: 4,   null: false
    t.datetime "completed_at"
    t.integer  "completed_by",     limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "breathtek_grossing_options", ["specimen_id"], name: "index_breathtek_grossing_options_on_specimen_id", using: :btree

  create_table "business_categories", force: :cascade do |t|
    t.string   "description", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "business_categories_business_reports", id: false, force: :cascade do |t|
    t.integer "business_category_id", limit: 4
    t.integer "business_report_id",   limit: 4
  end

  create_table "business_reports", force: :cascade do |t|
    t.string   "name",              limit: 255
    t.string   "description",       limit: 255
    t.string   "options",           limit: 255
    t.string   "reporting_options", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "business_reports_accounts", force: :cascade do |t|
    t.integer  "account_id",         limit: 4
    t.integer  "business_report_id", limit: 4
    t.datetime "last_run_at"
    t.integer  "user_id",            limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "business_reports_user_favorites", force: :cascade do |t|
    t.integer  "user_id",            limit: 4
    t.integer  "business_report_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "business_reports_users", force: :cascade do |t|
    t.integer  "user_id",            limit: 4
    t.integer  "business_report_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "case_attachments", force: :cascade do |t|
    t.integer  "case_id",      limit: 4
    t.string   "description",  limit: 255
    t.string   "document",     limit: 255
    t.integer  "file_type_id", limit: 4
    t.integer  "uploaded_by",  limit: 4
    t.integer  "parent_id",    limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "tps_id",       limit: 255
  end

  create_table "case_billings", force: :cascade do |t|
    t.integer  "case_id",              limit: 4,                     null: false
    t.text     "cpt_codes",            limit: 65535
    t.text     "icd9_codes",           limit: 65535
    t.boolean  "is_billed"
    t.integer  "billed_by",            limit: 4
    t.datetime "billed_at"
    t.text     "notes",                limit: 65535
    t.boolean  "approved_for_billing",               default: false
    t.boolean  "is_preliminary",                     default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "case_billings", ["case_id"], name: "index_case_billings_on_case_id", using: :btree

  create_table "case_exports", force: :cascade do |t|
    t.integer  "case_id",                 limit: 4
    t.integer  "patient_id",              limit: 4
    t.string   "case_number",             limit: 255
    t.string   "requisition_number",      limit: 255
    t.string   "patient_last_name",       limit: 255
    t.string   "patient_first_name",      limit: 255
    t.string   "patient_middle_initial",  limit: 255
    t.string   "case_status_description", limit: 255
    t.string   "triggered_by",            limit: 255
    t.text     "export_xml",              limit: 4294967295
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "processed"
    t.datetime "processed_at"
    t.string   "processed_error",         limit: 255
    t.boolean  "deliverable",                                default: false
  end

  add_index "case_exports", ["case_id"], name: "index_case_exports_on_case_id", using: :btree
  add_index "case_exports", ["processed"], name: "index_case_exports_on_processed", using: :btree
  add_index "case_exports", ["triggered_by", "case_number"], name: "index_case_exports_on_triggered_by_and_case_number", using: :btree

  create_table "case_histories", force: :cascade do |t|
    t.integer  "case_id",                      limit: 4
    t.integer  "user_id",                      limit: 4
    t.string   "description",                  limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "electronic_order_id",          limit: 4
    t.boolean  "patient_demographics_changed",             default: false
  end

  add_index "case_histories", ["case_id"], name: "index_case_histories_on_case_id", using: :btree
  add_index "case_histories", ["electronic_order_id"], name: "index_case_histories_on_electronic_order_id", using: :btree

  create_table "case_notes", force: :cascade do |t|
    t.integer  "case_id",    limit: 4,     null: false
    t.integer  "user_id",    limit: 4,     null: false
    t.string   "subject",    limit: 255
    t.text     "note_text",  limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "case_notes", ["case_id"], name: "index_case_notes_on_case_id", using: :btree

  create_table "case_qa_flags", force: :cascade do |t|
    t.integer  "case_id",     limit: 4,                   null: false
    t.integer  "account_id",  limit: 4
    t.integer  "qa_flag_id",  limit: 4
    t.string   "description", limit: 255
    t.integer  "logged_by",   limit: 4
    t.integer  "resolved_by", limit: 4
    t.boolean  "is_resolved",             default: false
    t.datetime "resolved_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "case_qa_flags", ["account_id"], name: "index_case_qa_flags_on_account_id", using: :btree
  add_index "case_qa_flags", ["case_id"], name: "index_case_qa_flags_on_case_id", using: :btree

  create_table "case_referrals", force: :cascade do |t|
    t.integer  "case_id",            limit: 4
    t.integer  "order_type_id",      limit: 4
    t.integer  "ordered_by",         limit: 4
    t.datetime "ordered_at"
    t.string   "requisition_number", limit: 255
    t.string   "tps_id",             limit: 255
  end

  create_table "case_tc_datas", force: :cascade do |t|
    t.string   "lab_location_text", limit: 255
    t.integer  "case_id",           limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "case_type_grossing_elements", force: :cascade do |t|
    t.integer  "parent_id",           limit: 4,                   null: false
    t.integer  "grossing_element_id", limit: 4,                   null: false
    t.boolean  "is_required",                     default: false
    t.string   "parent_type",         limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "case_type_grossing_elements", ["grossing_element_id"], name: "index_case_type_grossing_elements_on_grossing_element_id", using: :btree
  add_index "case_type_grossing_elements", ["parent_id"], name: "index_case_type_grossing_elements_on_parent_id", using: :btree

  create_table "case_type_image_types", force: :cascade do |t|
    t.integer  "case_type_id", limit: 4
    t.string   "image_type",   limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "case_type_prefixes", force: :cascade do |t|
    t.string "description", limit: 2
    t.string "tps_id",      limit: 36
  end

  add_index "case_type_prefixes", ["id"], name: "index_case_type_prefixes_on_id", unique: true, using: :btree

  create_table "case_types", force: :cascade do |t|
    t.string  "description",         limit: 255,                                null: false
    t.integer "case_type_prefix_id", limit: 4,                                  null: false
    t.string  "gross_option_type",   limit: 255
    t.boolean "has_prescreen"
    t.string  "tps_case_type_id",    limit: 36
    t.integer "bolt_on_type_id",     limit: 4
    t.string  "report_title",        limit: 255
    t.string  "image_support",       limit: 255
    t.string  "tc_tps_case_type_id", limit: 255
    t.string  "pc_tps_case_type_id", limit: 255
    t.boolean "cassette_printable"
    t.string  "report_template_id",  limit: 255
    t.boolean "is_tc"
    t.string  "loinc_code",          limit: 255, default: "11529-5"
    t.string  "loinc_description",   limit: 255, default: "Surgical Pathology"
    t.string  "coding_system",       limit: 255, default: "LN"
    t.boolean "is_pap"
    t.integer "owner_id",            limit: 4
  end

  add_index "case_types", ["case_type_prefix_id"], name: "index_case_types_on_case_type_prefix_id", using: :btree
  add_index "case_types", ["coding_system"], name: "index_case_types_on_coding_system", using: :btree
  add_index "case_types", ["loinc_code"], name: "index_case_types_on_loinc_code", using: :btree
  add_index "case_types", ["loinc_description"], name: "index_case_types_on_loinc_description", using: :btree
  add_index "case_types", ["owner_id"], name: "index_case_types_on_owner_id", using: :btree

  create_table "case_types_report_templates", id: false, force: :cascade do |t|
    t.integer "case_type_id",       limit: 4
    t.integer "report_template_id", limit: 4
  end

  add_index "case_types_report_templates", ["case_type_id"], name: "index_case_types_report_templates_on_case_type_id", using: :btree

  create_table "case_types_specimen_types", id: false, force: :cascade do |t|
    t.integer "case_type_id",     limit: 4, null: false
    t.integer "specimen_type_id", limit: 4, null: false
  end

  add_index "case_types_specimen_types", ["case_type_id", "specimen_type_id"], name: "ct_sp_ct_id_st_id_ix", using: :btree

  create_table "cases", force: :cascade do |t|
    t.string   "case_number",                        limit: 255,                   null: false
    t.integer  "case_type_id",                       limit: 4,                     null: false
    t.string   "requisition_number",                 limit: 50
    t.integer  "priority_id",                        limit: 4
    t.integer  "items",                              limit: 4,                     null: false
    t.integer  "client_account_location_id",         limit: 4
    t.integer  "client_account_physician_id",        limit: 4
    t.integer  "patient_id",                         limit: 4
    t.string   "chart_number",                       limit: 50
    t.text     "clinical_information",               limit: 65535
    t.datetime "collection_date"
    t.string   "search_tags",                        limit: 255
    t.integer  "condition_id",                       limit: 4
    t.integer  "previous_condition_id",              limit: 4
    t.integer  "account_id",                         limit: 4
    t.integer  "created_by",                         limit: 4
    t.boolean  "flagged_for_qa",                                   default: false
    t.boolean  "locked_for_qa",                                    default: false
    t.integer  "locked_for_qa_by",                   limit: 4
    t.integer  "assigned_to",                        limit: 4
    t.text     "comments",                           limit: 65535
    t.integer  "signed_out_by",                      limit: 4
    t.datetime "signed_out_at"
    t.integer  "prescreened_by",                     limit: 4
    t.datetime "prescreened_at"
    t.boolean  "is_prescreened"
    t.text     "addendum_text",                      limit: 65535
    t.text     "amendment_text",                     limit: 65535
    t.string   "cblpath_case_reference_number",      limit: 50
    t.integer  "amended_by",                         limit: 4
    t.datetime "amended_at"
    t.integer  "addended_by",                        limit: 4
    t.datetime "addended_at"
    t.datetime "received_at"
    t.integer  "processed_location_id",              limit: 4
    t.integer  "signed_out_location_id",             limit: 4
    t.boolean  "bill_client",                                      default: false
    t.boolean  "bill_patient",                                     default: false
    t.boolean  "held_for_billing",                                 default: false
    t.boolean  "billed",                                           default: false
    t.boolean  "approved_for_billing",                             default: false
    t.string   "a_authorization_number",             limit: 50
    t.string   "b_authorization_number",             limit: 50
    t.string   "c_authorization_number",             limit: 50
    t.datetime "interpreted_at"
    t.datetime "processed_at"
    t.datetime "approved_for_billing_at"
    t.string   "tps_requistion_number",              limit: 50
    t.string   "tps_id",                             limit: 36
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "orders_seed",                        limit: 4,     default: 1
    t.datetime "accessioned_at"
    t.datetime "assigned_at"
    t.boolean  "is_tc",                                            default: false
    t.integer  "order_type_id",                      limit: 4
    t.datetime "held_for_billing_at"
    t.integer  "held_for_billing_by",                limit: 4
    t.string   "hospital_id",                        limit: 255
    t.boolean  "has_digital_slides",                               default: false
    t.boolean  "alternate_map"
    t.string   "external_reference_number",          limit: 255
    t.string   "external_notes",                     limit: 255
    t.integer  "processed_user_id",                  limit: 4
    t.string   "tests_swapped",                      limit: 255
    t.boolean  "viewed",                                           default: false
    t.boolean  "has_special_procedures_orders",                    default: false
    t.boolean  "outbound_tc"
    t.integer  "preliminary_signed_out_location_id", limit: 4
    t.integer  "preliminary_signed_out_by",          limit: 4
    t.integer  "released_by",                        limit: 4
    t.datetime "released_at"
    t.integer  "completed_by",                       limit: 4
    t.datetime "preliminary_signed_out_at"
    t.boolean  "is_correlated"
    t.boolean  "imported"
    t.boolean  "hold_for_reflex"
  end

  add_index "cases", ["account_id", "assigned_to", "condition_id"], name: "unassigned_count", using: :btree
  add_index "cases", ["account_id", "case_number"], name: "index_cases_on_account_id_and_case_number", using: :btree
  add_index "cases", ["account_id"], name: "index_cases_on_account_id", using: :btree
  add_index "cases", ["approved_for_billing", "billed", "held_for_billing", "account_id", "signed_out_at"], name: "cases_billing", using: :btree
  add_index "cases", ["assigned_to", "condition_id"], name: "my_case_tab_pathology_dashboard", using: :btree
  add_index "cases", ["assigned_to", "flagged_for_qa"], name: "pathology_dashboard", using: :btree
  add_index "cases", ["assigned_to", "has_special_procedures_orders"], name: "my_case_pathology_dashboard", using: :btree
  add_index "cases", ["assigned_to", "viewed"], name: "my_case_special_studies_tab", using: :btree
  add_index "cases", ["assigned_to"], name: "index_cases_on_assigned_to", using: :btree
  add_index "cases", ["case_type_id"], name: "index_cases_on_case_type_id", using: :btree
  add_index "cases", ["client_account_location_id", "client_account_physician_id", "patient_id", "account_id", "received_at", "accessioned_at"], name: "NewAccess", using: :btree
  add_index "cases", ["client_account_location_id"], name: "index_cases_on_client_account_location_id", using: :btree
  add_index "cases", ["collection_date"], name: "collection_date", using: :btree
  add_index "cases", ["condition_id"], name: "index_cases_on_condition_id", using: :btree
  add_index "cases", ["has_special_procedures_orders"], name: "index_cases_on_has_special_procedures_orders", using: :btree
  add_index "cases", ["patient_id"], name: "index_cases_on_patient_id", using: :btree
  add_index "cases", ["preliminary_signed_out_by"], name: "index_cases_on_preliminary_signed_out_by", using: :btree
  add_index "cases", ["preliminary_signed_out_location_id"], name: "index_cases_on_preliminary_signed_out_location_id", using: :btree
  add_index "cases", ["priority_id", "assigned_to", "condition_id", "account_id"], name: "pathology_dashboard_performance", using: :btree
  add_index "cases", ["processed_location_id"], name: "index_cases_on_processed_location_id", using: :btree
  add_index "cases", ["received_at"], name: "index_cases_on_received_at", using: :btree
  add_index "cases", ["released_by"], name: "index_cases_on_released_by", using: :btree
  add_index "cases", ["requisition_number", "case_number", "tps_requistion_number", "search_tags", "hospital_id", "chart_number", "cblpath_case_reference_number"], name: "case_search", type: :fulltext
  add_index "cases", ["signed_out_at", "signed_out_by", "account_id"], name: "pathology_dashboard_signed_out_total", using: :btree
  add_index "cases", ["signed_out_at", "signed_out_by"], name: "pathology_dashboard_charts", using: :btree
  add_index "cases", ["signed_out_by", "signed_out_at"], name: "pathology_dashboard_chart", using: :btree
  add_index "cases", ["signed_out_location_id"], name: "index_cases_on_signed_out_location_id", using: :btree
  add_index "cases", ["viewed"], name: "index_cases_on_viewed", using: :btree

  create_table "cases_pap_reflex_rules", id: false, force: :cascade do |t|
    t.integer "case_id",            limit: 4
    t.integer "pap_reflex_rule_id", limit: 4
  end

  add_index "cases_pap_reflex_rules", ["pap_reflex_rule_id", "case_id"], name: "case_pap_reflex_rule_idx", using: :btree

  create_table "cases_referring_physicians", force: :cascade do |t|
    t.integer "case_id",                limit: 4,                 null: false
    t.integer "referring_physician_id", limit: 4,                 null: false
    t.boolean "display_on_report",                default: false
  end

  add_index "cases_referring_physicians", ["case_id", "referring_physician_id"], name: "cases_rp_case_id_rp_id_ix", using: :btree

  create_table "cassette_colors", force: :cascade do |t|
    t.string  "description",     limit: 20
    t.integer "carousel_number", limit: 4
  end

  create_table "cassette_print_outlets", force: :cascade do |t|
    t.string "description", limit: 255
  end

  create_table "cbc_code_groups", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cbc_codes", force: :cascade do |t|
    t.string   "code",              limit: 255
    t.string   "unit",              limit: 255
    t.boolean  "has_percent"
    t.integer  "maximum",           limit: 4
    t.integer  "precision",         limit: 4
    t.integer  "cbc_code_group_id", limit: 4
    t.integer  "order",             limit: 4
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "report_order",      limit: 4
  end

  add_index "cbc_codes", ["active"], name: "index_cbc_codes_on_active", using: :btree
  add_index "cbc_codes", ["cbc_code_group_id"], name: "index_cbc_codes_on_cbc_code_group_id", using: :btree

  create_table "client_account_location_report_preferences", force: :cascade do |t|
    t.integer  "client_account_location_id",  limit: 4,                 null: false
    t.boolean  "jar_order",                             default: false
    t.boolean  "show_icd9",                             default: false
    t.boolean  "all_referring",                         default: false
    t.boolean  "mask_ssn",                              default: false
    t.boolean  "patient_phone",                         default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "hide_referring_physician",              default: false
    t.boolean  "display_requisition_number"
    t.boolean  "deliver_preliminary_reports"
  end

  create_table "client_account_locations", force: :cascade do |t|
    t.string   "address_one",              limit: 255,                null: false
    t.string   "address_two",              limit: 255
    t.string   "city",                     limit: 255,                null: false
    t.string   "state",                    limit: 2,                  null: false
    t.string   "zip",                      limit: 10,                 null: false
    t.integer  "client_account_id",        limit: 4,                  null: false
    t.boolean  "active",                               default: true
    t.string   "primary_contact",          limit: 255
    t.string   "phone",                    limit: 10
    t.string   "fax",                      limit: 10
    t.string   "location_number",          limit: 255
    t.string   "tps_id",                   limit: 36
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "suffix",                   limit: 255
    t.string   "external_system_id",       limit: 255
    t.string   "image_capture_preference", limit: 255
    t.boolean  "imported"
  end

  add_index "client_account_locations", ["client_account_id"], name: "index_client_account_locations_on_client_account_id", using: :btree

  create_table "client_account_locations_client_account_physicians", id: false, force: :cascade do |t|
    t.integer "client_account_location_id",  limit: 4, null: false
    t.integer "client_account_physician_id", limit: 4, null: false
  end

  add_index "client_account_locations_client_account_physicians", ["client_account_location_id", "client_account_physician_id"], name: "cal_cap_cal_id_cap_id_ix", using: :btree

  create_table "client_account_physicians", force: :cascade do |t|
    t.string   "first_name",     limit: 255,                null: false
    t.string   "last_name",      limit: 255,                null: false
    t.string   "title",          limit: 255
    t.string   "suffix",         limit: 255
    t.string   "middle_initial", limit: 1
    t.string   "credentials",    limit: 255
    t.string   "npi",            limit: 255
    t.string   "upin",           limit: 255
    t.integer  "specialty_id",   limit: 4
    t.string   "tps_id",         limit: 36
    t.boolean  "active",                     default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "account_id",     limit: 4,                  null: false
  end

  add_index "client_account_physicians", ["account_id", "active"], name: "pap_rptFindPhysiciansParms2", using: :btree

  create_table "client_account_todos", force: :cascade do |t|
    t.string   "title",             limit: 255
    t.string   "description",       limit: 255
    t.boolean  "important",                     default: false
    t.boolean  "complete",                      default: false
    t.integer  "client_account_id", limit: 4,                   null: false
    t.string   "last_updated_by",   limit: 255
    t.string   "link",              limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "client_account_todos", ["client_account_id"], name: "index_client_account_todos_on_client_account_id", using: :btree

  create_table "client_accounts", force: :cascade do |t|
    t.integer  "account_id",      limit: 4,                   null: false
    t.string   "account_name",    limit: 255,                 null: false
    t.string   "account_number",  limit: 255,                 null: false
    t.string   "primary_contact", limit: 255,                 null: false
    t.string   "phone",           limit: 10,                  null: false
    t.string   "fax",             limit: 10
    t.boolean  "active",                      default: true
    t.boolean  "favorite",                    default: false
    t.integer  "location_seed",   limit: 4,   default: 1
    t.string   "tps_id",          limit: 36
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "matchable",                   default: true
    t.boolean  "imported"
  end

  add_index "client_accounts", ["account_id"], name: "index_client_accounts_on_account_id", using: :btree

  create_table "client_accounts_order_entry_questions", id: false, force: :cascade do |t|
    t.integer "client_account_id",       limit: 4
    t.integer "order_entry_question_id", limit: 4
  end

  add_index "client_accounts_order_entry_questions", ["client_account_id", "order_entry_question_id"], name: "client_account_order_entry_question", using: :btree

  create_table "client_patient_histories", force: :cascade do |t|
    t.integer  "user_id",             limit: 4
    t.integer  "case_id",             limit: 4
    t.integer  "order_id",            limit: 4
    t.integer  "patient_id",          limit: 4
    t.integer  "client_account_id",   limit: 4
    t.string   "current_identifier",  limit: 255
    t.string   "previous_identifier", limit: 255
    t.string   "description",         limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "client_patient_histories", ["case_id", "client_account_id"], name: "cph_idx", using: :btree

  create_table "client_report_templates", force: :cascade do |t|
    t.integer  "client_account_location_id", limit: 4
    t.integer  "case_type_id",               limit: 4
    t.integer  "report_template_id",         limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "client_report_templates", ["client_account_location_id", "case_type_id"], name: "idxClientReportTemplates", using: :btree

  create_table "clinical_observations", force: :cascade do |t|
    t.integer  "case_id",             limit: 4
    t.integer  "electronic_order_id", limit: 4
    t.string   "value_type",          limit: 10
    t.string   "identifier",          limit: 10
    t.string   "value",               limit: 25
    t.string   "external_test_code",  limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "clinical_observations", ["case_id"], name: "index_clinical_observations_on_case_id", using: :btree
  add_index "clinical_observations", ["electronic_order_id"], name: "index_clinical_observations_on_electronic_order_id", using: :btree

  create_table "clinical_results", force: :cascade do |t|
    t.integer  "case_id",               limit: 4
    t.integer  "electronic_order_id",   limit: 4
    t.string   "requisition_number",    limit: 255
    t.string   "message_control_id",    limit: 255
    t.string   "test_code",             limit: 255
    t.string   "test_name",             limit: 255
    t.boolean  "is_highlighted_result"
    t.string   "result",                limit: 255
    t.string   "reference_range",       limit: 255
    t.string   "unit",                  limit: 255
    t.text     "comment",               limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "panel_name",            limit: 255
    t.string   "result_code",           limit: 255
    t.string   "abnormal_code",         limit: 20
  end

  add_index "clinical_results", ["case_id"], name: "index_clinical_results_on_case_id", using: :btree
  add_index "clinical_results", ["electronic_order_id"], name: "index_clinical_results_on_electronic_order_id", using: :btree
  add_index "clinical_results", ["panel_name"], name: "index_clinical_results_on_panel_name", using: :btree
  add_index "clinical_results", ["result_code"], name: "index_clinical_results_on_result_code", using: :btree

  create_table "conditions", force: :cascade do |t|
    t.string   "description", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "configurables", force: :cascade do |t|
    t.string   "description", limit: 255
    t.string   "setting",     limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title",       limit: 255
    t.text     "details",     limit: 65535
    t.integer  "account_id",  limit: 4
  end

  add_index "configurables", ["description"], name: "my_case_special_studies_tab", using: :btree

  create_table "contact_types", force: :cascade do |t|
    t.string   "description", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contacts", force: :cascade do |t|
    t.string   "email",           limit: 255
    t.string   "first_name",      limit: 255
    t.string   "middle_initial",  limit: 1
    t.string   "last_name",       limit: 255
    t.string   "phone",           limit: 255
    t.string   "fax",             limit: 255
    t.boolean  "active",                      default: true
    t.integer  "contact_type_id", limit: 4
    t.integer  "owner_id",        limit: 4
    t.string   "owner_type",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "control_code_types", force: :cascade do |t|
    t.string   "description", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "control_codes", force: :cascade do |t|
    t.integer  "account_id",               limit: 4,                     null: false
    t.string   "description",              limit: 255
    t.text     "code_text",                limit: 65535
    t.string   "code_name",                limit: 255
    t.integer  "case_type_id",             limit: 4
    t.boolean  "active",                                 default: true
    t.boolean  "is_readonly",                            default: false
    t.integer  "control_code_type_id",     limit: 4
    t.text     "microscopic_description",  limit: 65535
    t.text     "diagnosis_description",    limit: 65535
    t.text     "comments",                 limit: 65535
    t.string   "icd9",                     limit: 255
    t.integer  "dx_classification_id",     limit: 4
    t.integer  "dx_sub_classification_id", limit: 4
    t.boolean  "is_insitu",                              default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "lymphoid_cells",           limit: 65535
    t.text     "myeloid_cells",            limit: 65535
    t.text     "monocytic_cells",          limit: 65535
    t.text     "plasma_cells",             limit: 65535
    t.text     "debris",                   limit: 65535
    t.text     "morphology",               limit: 65535
    t.text     "blasts",                   limit: 65535
    t.text     "phenotype",                limit: 65535
    t.boolean  "hgpin"
    t.string   "pti",                      limit: 255
    t.string   "gleason_one",              limit: 255
    t.string   "gleason_two",              limit: 255
    t.integer  "pap_dx_id",                limit: 4
    t.integer  "adequacy_id",              limit: 4
    t.text     "adequacy_description",     limit: 65535
    t.text     "infection",                limit: 65535
    t.string   "pap_dx_external_code",     limit: 20
    t.string   "adequacy_external_code",   limit: 20
    t.string   "icd10",                    limit: 255
  end

  add_index "control_codes", ["account_id", "control_code_type_id"], name: "index_control_codes_on_account_id_and_control_code_type_id", using: :btree
  add_index "control_codes", ["adequacy_id"], name: "index_control_codes_on_adequacy_id", using: :btree
  add_index "control_codes", ["case_type_id"], name: "index_control_codes_on_case_type_id", using: :btree
  add_index "control_codes", ["pap_dx_id"], name: "index_control_codes_on_pap_dx_id", using: :btree

  create_table "control_tmp", force: :cascade do |t|
    t.integer  "account_id",               limit: 4,                     null: false
    t.string   "description",              limit: 255
    t.text     "code_text",                limit: 65535
    t.string   "code_name",                limit: 255
    t.integer  "case_type_id",             limit: 4
    t.boolean  "active",                                 default: true
    t.boolean  "is_readonly",                            default: false
    t.integer  "control_code_type_id",     limit: 4
    t.text     "microscopic_description",  limit: 65535
    t.text     "diagnosis_description",    limit: 65535
    t.text     "comments",                 limit: 65535
    t.string   "icd9",                     limit: 255
    t.integer  "dx_classification_id",     limit: 4
    t.integer  "dx_sub_classification_id", limit: 4
    t.boolean  "is_insitu",                              default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "lymphoid_cells",           limit: 65535
    t.text     "myeloid_cells",            limit: 65535
    t.text     "monocytic_cells",          limit: 65535
    t.text     "plasma_cells",             limit: 65535
    t.text     "debris",                   limit: 65535
    t.text     "morphology",               limit: 65535
    t.text     "blasts",                   limit: 65535
    t.text     "phenotype",                limit: 65535
    t.boolean  "hgpin"
    t.string   "pti",                      limit: 255
    t.string   "gleason_one",              limit: 255
    t.string   "gleason_two",              limit: 255
    t.integer  "pap_dx_id",                limit: 4
    t.integer  "adequacy_id",              limit: 4
    t.text     "adequacy_description",     limit: 65535
    t.text     "infection",                limit: 65535
    t.string   "pap_dx_external_code",     limit: 20
    t.string   "adequacy_external_code",   limit: 20
    t.string   "icd10",                    limit: 255
  end

  add_index "control_tmp", ["account_id", "control_code_type_id"], name: "index_control_codes_on_account_id_and_control_code_type_id", using: :btree
  add_index "control_tmp", ["adequacy_id"], name: "index_control_codes_on_adequacy_id", using: :btree
  add_index "control_tmp", ["case_type_id"], name: "index_control_codes_on_case_type_id", using: :btree
  add_index "control_tmp", ["pap_dx_id"], name: "index_control_codes_on_pap_dx_id", using: :btree

  create_table "cpt_billing_unit_rules", force: :cascade do |t|
    t.string   "cpt_code",             limit: 15
    t.integer  "first_unit_count",     limit: 4
    t.integer  "remaining_unit_count", limit: 4
    t.date     "start_date"
    t.date     "end_date"
    t.boolean  "active",                           default: true
    t.string   "description",          limit: 255
    t.string   "name",                 limit: 255
    t.integer  "account_id",           limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_cpt_code",       limit: 15
    t.string   "remaining_cpt_code",   limit: 15
    t.integer  "created_by",           limit: 4
    t.boolean  "per_specimen",                     default: true
  end

  create_table "cpt_code_rules", force: :cascade do |t|
    t.string   "name",             limit: 255
    t.integer  "originating_test", limit: 4
    t.string   "swapping_tests",   limit: 255
    t.integer  "control_code_id",  limit: 4
    t.integer  "account_id",       limit: 4
    t.integer  "created_by",       limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "rule_number",      limit: 4
  end

  add_index "cpt_code_rules", ["account_id"], name: "index_cpt_code_rules_on_account_id", using: :btree
  add_index "cpt_code_rules", ["control_code_id"], name: "index_cpt_code_rules_on_control_code_id", using: :btree
  add_index "cpt_code_rules", ["id"], name: "index_cpt_code_rules_on_id", using: :btree
  add_index "cpt_code_rules", ["originating_test"], name: "index_cpt_code_rules_on_originating_test", using: :btree
  add_index "cpt_code_rules", ["swapping_tests"], name: "index_cpt_code_rules_on_swapping_tests", using: :btree

  create_table "custom_signatures", force: :cascade do |t|
    t.integer "user_id",      limit: 4,   null: false
    t.integer "account_id",   limit: 4,   null: false
    t.integer "case_type_id", limit: 4,   null: false
    t.string  "body",         limit: 255
  end

  create_table "cyto_grossing_options", force: :cascade do |t|
    t.string   "specimen_size",       limit: 255
    t.string   "specimen_color",      limit: 255
    t.integer  "number_of_pieces",    limit: 4
    t.integer  "number_of_cassettes", limit: 4
    t.integer  "number_of_slides",    limit: 4
    t.string   "clarity",             limit: 255
    t.string   "cassette_label",      limit: 255
    t.integer  "specimen_id",         limit: 4,   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "thin_prep",           limit: 255
    t.string   "cyto_spin",           limit: 255
    t.string   "smears",              limit: 255
    t.string   "fluid_volume",        limit: 255
    t.datetime "time_of_fixation"
    t.datetime "time_of_processing"
    t.integer  "cassette_color_id",   limit: 4
  end

  add_index "cyto_grossing_options", ["specimen_id"], name: "index_cyto_grossing_options_on_specimen_id", using: :btree

  create_table "cytology_description_results", force: :cascade do |t|
    t.integer  "cytology_description_id", limit: 4
    t.string   "comments",                limit: 255
    t.integer  "value",                   limit: 4
    t.boolean  "include_in_report"
    t.integer  "cytology_summary_id",     limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cytology_description_results", ["cytology_description_id"], name: "index_cytology_description_results_on_cytology_description_id", using: :btree
  add_index "cytology_description_results", ["cytology_summary_id"], name: "index_cytology_description_results_on_cytology_summary_id", using: :btree

  create_table "cytology_descriptions", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.integer  "order",       limit: 4
    t.boolean  "active",                  default: true
    t.boolean  "is_required",             default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cytology_differential_results", force: :cascade do |t|
    t.integer  "cytology_differential_id", limit: 4
    t.string   "comments",                 limit: 255
    t.integer  "value",                    limit: 4
    t.boolean  "is_fraction",                          default: false
    t.boolean  "include_in_report"
    t.integer  "cytology_summary_id",      limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cytology_differential_results", ["cytology_differential_id"], name: "index_cytology_differential_results_on_cytology_differential_id", using: :btree
  add_index "cytology_differential_results", ["cytology_summary_id"], name: "index_cytology_differential_results_on_cytology_summary_id", using: :btree

  create_table "cytology_differentials", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.integer  "order",       limit: 4
    t.boolean  "active",                  default: true
    t.boolean  "is_required",             default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "range_low",   limit: 4
    t.integer  "range_high",  limit: 4
  end

  create_table "cytology_results", force: :cascade do |t|
    t.integer  "specimen_id",                  limit: 4,     null: false
    t.text     "adequacy",                     limit: 65535
    t.text     "erythrocytes",                 limit: 65535
    t.text     "renal_cyturia",                limit: 65535
    t.text     "casts",                        limit: 65535
    t.text     "pathologic_casts",             limit: 65535
    t.text     "pathologic_crystals",          limit: 65535
    t.text     "physiologic_crystals",         limit: 65535
    t.text     "microorganisms",               limit: 65535
    t.text     "inflammation",                 limit: 65535
    t.text     "non_specific",                 limit: 65535
    t.text     "urinalysis_results",           limit: 65535
    t.text     "immuno_cyto_chemical_results", limit: 65535
    t.text     "references",                   limit: 65535
    t.datetime "completed_at"
    t.integer  "completed_by",                 limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cytology_results", ["specimen_id"], name: "index_cytology_results_on_specimen_id", using: :btree

  create_table "cytology_summaries", force: :cascade do |t|
    t.integer  "specimen_id",       limit: 4
    t.boolean  "include_in_report",             default: true
    t.string   "me_ratio",          limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cytology_summaries", ["specimen_id"], name: "index_cytology_summaries_on_specimen_id", using: :btree

  create_table "default_amendment_reasons", force: :cascade do |t|
    t.string   "description", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "default_qa_categories", force: :cascade do |t|
    t.string   "description", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "default_qa_flags", force: :cascade do |t|
    t.integer  "default_qa_category_id", limit: 4
    t.string   "title",                  limit: 255
    t.string   "description",            limit: 255
    t.boolean  "lock_case"
    t.text     "suggested_resolution",   limit: 65535
    t.boolean  "pre_analytical"
    t.boolean  "post_analytical"
    t.boolean  "analytical"
    t.boolean  "active"
    t.boolean  "hidden"
    t.boolean  "is_readonly"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "default_roles", force: :cascade do |t|
    t.string   "description", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "default_roles_permissions", id: false, force: :cascade do |t|
    t.integer "default_role_id", limit: 4, null: false
    t.integer "permission_id",   limit: 4, null: false
  end

  add_index "default_roles_permissions", ["default_role_id", "permission_id"], name: "drp_dr_id_p_id_ix", using: :btree

  create_table "delivery_methods", force: :cascade do |t|
    t.string   "name",                  limit: 255
    t.string   "validation_expression", limit: 255
    t.boolean  "is_user_configurable",              default: true
    t.boolean  "is_active",                         default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "print_required",                    default: false
    t.string   "tps_id",                limit: 255
  end

  create_table "delivery_rules", force: :cascade do |t|
    t.integer  "client_account_location_id", limit: 4,                  null: false
    t.integer  "delivery_method_id",         limit: 4,                  null: false
    t.string   "destination",                limit: 255
    t.boolean  "active",                                 default: true
    t.integer  "number_of_copies",           limit: 4,   default: 1
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "local_report_library_path",  limit: 255
  end

  add_index "delivery_rules", ["client_account_location_id"], name: "index_delivery_rules_on_client_account_location_id", using: :btree
  add_index "delivery_rules", ["delivery_method_id"], name: "index_delivery_rules_on_delivery_method_id", using: :btree

  create_table "dipstick_results", force: :cascade do |t|
    t.integer  "specimen_id",       limit: 4,  null: false
    t.string   "specific_gravity",  limit: 10
    t.string   "ph",                limit: 10
    t.string   "protein",           limit: 50
    t.string   "glucose",           limit: 50
    t.string   "ketone",            limit: 50
    t.string   "blood",             limit: 50
    t.string   "nitrite",           limit: 50
    t.string   "leukocyte",         limit: 50
    t.string   "bilirubin",         limit: 50
    t.string   "urobilinogen",      limit: 50
    t.boolean  "display_on_report"
    t.string   "specimen_level",    limit: 50
    t.datetime "completed_at"
    t.integer  "completed_by",      limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "dipstick_results", ["specimen_id"], name: "index_dipstick_results_on_specimen_id", using: :btree

  create_table "disclaimer_types", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "disclaimers", force: :cascade do |t|
    t.text     "description",        limit: 16777215
    t.integer  "account_id",         limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "images_required"
    t.string   "disclaimer_type",    limit: 255
    t.string   "name",               limit: 255
    t.integer  "sort_order",         limit: 4
    t.integer  "disclaimer_type_id", limit: 4
  end

  create_table "dx_classifications", force: :cascade do |t|
    t.string   "description",    limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "diagnosis_type", limit: 255
  end

  add_index "dx_classifications", ["description"], name: "pathology_dashboard", using: :btree

  create_table "dx_sub_classifications", force: :cascade do |t|
    t.string   "description", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dyk_faqs", force: :cascade do |t|
    t.text     "faq",        limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dyk_tests", force: :cascade do |t|
    t.integer  "dyk_id",           limit: 4
    t.integer  "specimen_test_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dyk_types", force: :cascade do |t|
    t.string   "category",   limit: 255
    t.string   "section",    limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dyks", force: :cascade do |t|
    t.integer  "dyk_faq_id",  limit: 4
    t.integer  "dyk_type_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "electronic_order_histories", force: :cascade do |t|
    t.integer  "electronic_order_id", limit: 4,   null: false
    t.integer  "user_id",             limit: 4,   null: false
    t.string   "description",         limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "electronic_orders", force: :cascade do |t|
    t.integer  "account_id",                   limit: 4
    t.string   "external_requisition_number",  limit: 255
    t.string   "requisition_number",           limit: 255
    t.integer  "patient_id",                   limit: 4
    t.integer  "client_account_id",            limit: 4
    t.boolean  "has_qa_errors"
    t.string   "qa_error_description",         limit: 255
    t.integer  "client_account_location_id",   limit: 4
    t.integer  "client_account_physician_id",  limit: 4
    t.string   "status",                       limit: 255
    t.binary   "order_message",                limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "external_test_code",           limit: 255
    t.string   "external_test_description",    limit: 255
    t.boolean  "deleted",                                    default: false
    t.string   "comments",                     limit: 255
    t.boolean  "has_case"
    t.integer  "case_id",                      limit: 4
    t.string   "internal_notes",               limit: 255
    t.string   "external_notes",               limit: 255
    t.datetime "received_at"
    t.datetime "collection_date"
    t.string   "patient_alternate_identifier", limit: 255,   default: "0"
    t.integer  "patients_client_accounts_id",  limit: 4
    t.boolean  "is_reflex",                                  default: false
    t.integer  "assigned_to",                  limit: 4
    t.datetime "assigned_at"
  end

  add_index "electronic_orders", ["account_id"], name: "index_electronic_orders_on_account_id", using: :btree
  add_index "electronic_orders", ["assigned_to"], name: "index_electronic_orders_on_assigned_to", using: :btree
  add_index "electronic_orders", ["case_id"], name: "index_electronic_orders_on_case_id", using: :btree
  add_index "electronic_orders", ["deleted"], name: "index_electronic_orders_on_deleted", using: :btree
  add_index "electronic_orders", ["external_requisition_number"], name: "index_electronic_orders_on_external_requisition_number", using: :btree
  add_index "electronic_orders", ["external_test_code"], name: "index_electronic_orders_on_external_test_code", using: :btree
  add_index "electronic_orders", ["has_case"], name: "index_electronic_orders_on_has_case", using: :btree
  add_index "electronic_orders", ["is_reflex"], name: "index_electronic_orders_on_is_reflex", using: :btree
  add_index "electronic_orders", ["requisition_number"], name: "index_electronic_orders_on_requisition_number", using: :btree

  create_table "electronic_results", force: :cascade do |t|
    t.integer  "account_id",          limit: 4
    t.integer  "case_id",             limit: 4
    t.integer  "electronic_order_id", limit: 4
    t.text     "diagnostic_data",     limit: 65535
    t.string   "send_out_location",   limit: 255
    t.string   "requisition_number",  limit: 255
    t.string   "test_code",           limit: 255
    t.string   "test_description",    limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "export_results", force: :cascade do |t|
  end

  create_table "external_orders", force: :cascade do |t|
    t.integer  "condition_id",         limit: 4
    t.integer  "order_item_id",        limit: 4
    t.string   "order_item_type",      limit: 255
    t.string   "requisition_number",   limit: 255
    t.integer  "user_id",              limit: 4
    t.integer  "account_id",           limit: 4
    t.integer  "case_id",              limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "viewed",                           default: false
    t.boolean  "new_case",                         default: false
    t.boolean  "is_tc",                            default: false
    t.integer  "ordering_pathologist", limit: 4
  end

  add_index "external_orders", ["case_id"], name: "IX_Orders", using: :btree
  add_index "external_orders", ["condition_id", "id", "user_id"], name: "pathology_dashboard", using: :btree
  add_index "external_orders", ["condition_id", "user_id", "case_id"], name: "pathology_dashboard_external_studies_tab", using: :btree
  add_index "external_orders", ["order_item_id", "order_item_type"], name: "my_case_special_studies_tab", using: :btree

  create_table "external_test_codes", force: :cascade do |t|
    t.integer  "account_id",          limit: 4
    t.string   "test_code",           limit: 15
    t.boolean  "resultable"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_discreet_result",                            null: false
    t.boolean  "is_highlighted_test",                           null: false
    t.boolean  "hold_for_reflex"
    t.boolean  "result_required",                default: true
  end

  add_index "external_test_codes", ["account_id", "test_code"], name: "index_external_test_codes_on_account_id_and_test_code", using: :btree
  add_index "external_test_codes", ["account_id"], name: "index_external_test_codes_on_account_id", using: :btree
  add_index "external_test_codes", ["test_code"], name: "index_external_test_codes_on_test_code", using: :btree

  create_table "fcs_billings", force: :cascade do |t|
    t.integer  "specimen_id",      limit: 4
    t.integer  "case_id",          limit: 4
    t.string   "cpt_code",         limit: 255
    t.integer  "units",            limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "added_to_billing",             default: false
  end

  create_table "file_types", force: :cascade do |t|
    t.string   "description", limit: 255
    t.string   "icon",        limit: 50
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fish_oncology_panel_results", force: :cascade do |t|
    t.integer  "specimen_id",             limit: 4
    t.integer  "specimen_test_id",        limit: 4
    t.integer  "fish_oncology_result_id", limit: 4
    t.string   "specimen_test_name",      limit: 255
    t.text     "interpretation",          limit: 65535
    t.text     "probe_results",           limit: 65535
    t.string   "iscn",                    limit: 255
    t.boolean  "positive"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "tps_id",                  limit: 255
  end

  add_index "fish_oncology_panel_results", ["tps_id"], name: "index_fish_oncology_panel_results_on_tps_id", using: :btree

  create_table "fish_oncology_results", force: :cascade do |t|
    t.integer  "specimen_id",                   limit: 4
    t.text     "result",                        limit: 65535
    t.text     "methodology",                   limit: 65535
    t.text     "comments",                      limit: 65535
    t.text     "references",                    limit: 65535
    t.boolean  "use_probe_set_names_on_report"
    t.boolean  "display_on_report"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "icd9_code",                     limit: 255
    t.integer  "user_id",                       limit: 4
    t.string   "processing_lab_text",           limit: 255
  end

  add_index "fish_oncology_results", ["user_id"], name: "index_fish_oncology_results_on_user_id", using: :btree

  create_table "fish_results", force: :cascade do |t|
    t.integer  "specimen_id",  limit: 4,   null: false
    t.string   "gains",        limit: 255
    t.string   "losses",       limit: 255
    t.string   "totals",       limit: 255
    t.datetime "completed_at"
    t.integer  "completed_by", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "fish_results", ["specimen_id"], name: "index_fish_results_on_specimen_id", using: :btree

  create_table "flow_groups", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.text     "markers",    limit: 65535
    t.integer  "user_id",    limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "flow_intensities", force: :cascade do |t|
    t.string   "description", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "flow_marker_types", force: :cascade do |t|
    t.string   "description", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "flow_markers", force: :cascade do |t|
    t.string   "description",         limit: 255
    t.integer  "flow_marker_type_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "flow_population_results", force: :cascade do |t|
    t.integer  "flow_population_type_id", limit: 4
    t.integer  "heme_flow_result_id",     limit: 4
    t.text     "result",                  limit: 65535
    t.boolean  "display_on_report",                     default: false
    t.integer  "order",                   limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "flow_population_types", force: :cascade do |t|
    t.string   "description", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "frozen_results", force: :cascade do |t|
    t.string   "diagnosis",   limit: 255
    t.integer  "case_id",     limit: 4
    t.integer  "specimen_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "genders", force: :cascade do |t|
    t.string "description", limit: 255, null: false
    t.string "value",       limit: 1,   null: false
  end

  create_table "global_delivery_rules", force: :cascade do |t|
    t.string   "method",        limit: 255
    t.string   "destination",   limit: 255
    t.string   "port",          limit: 255
    t.string   "active",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "account_id",    limit: 4
    t.string   "name",          limit: 255
    t.string   "delivery_type", limit: 255
  end

  create_table "grossing_elements", force: :cascade do |t|
    t.string   "name",              limit: 255
    t.string   "element_type",      limit: 255
    t.integer  "variable_field_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "grossing_options", force: :cascade do |t|
    t.string   "specimen_size",       limit: 255
    t.string   "specimen_color",      limit: 255
    t.integer  "number_of_pieces",    limit: 4
    t.integer  "number_of_cassettes", limit: 4
    t.integer  "number_of_slides",    limit: 4
    t.string   "medium",              limit: 255
    t.string   "cassette_label",      limit: 255
    t.string   "cycle",               limit: 255
    t.integer  "specimen_id",         limit: 4
    t.string   "clarity",             limit: 255
    t.integer  "cassette_color_id",   limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "time_of_fixation"
    t.datetime "time_of_processing"
  end

  create_table "heme_comp_summaries", force: :cascade do |t|
    t.integer  "case_id",              limit: 4
    t.integer  "dx_classification_id", limit: 4
    t.text     "diagnosis",            limit: 65535
    t.text     "morphology",           limit: 65535
    t.text     "flow",                 limit: 65535
    t.text     "cytogenetics",         limit: 65535
    t.text     "fish",                 limit: 65535
    t.text     "molecular",            limit: 65535
    t.boolean  "include_comp_summary"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "icd9",                 limit: 255
    t.boolean  "include_summary_page",               default: true
  end

  create_table "heme_flow_marker_results", force: :cascade do |t|
    t.integer  "heme_flow_result_id", limit: 4
    t.integer  "flow_marker_id",      limit: 4
    t.integer  "percentage",          limit: 4
    t.integer  "flow_intensity_id",   limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "display_on_report",               default: true
    t.string   "tps_id",              limit: 255
  end

  add_index "heme_flow_marker_results", ["heme_flow_result_id"], name: "index_heme_flow_marker_results_on_heme_flow_result_id", using: :btree
  add_index "heme_flow_marker_results", ["tps_id"], name: "index_heme_flow_marker_results_on_tps_id", using: :btree

  create_table "heme_flow_results", force: :cascade do |t|
    t.integer  "specimen_id",         limit: 4
    t.datetime "processed_at"
    t.integer  "viability",           limit: 4
    t.text     "pending",             limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "completed_by",        limit: 4
    t.boolean  "inconclusive",                                              default: false
    t.decimal  "myeloid",                           precision: 5, scale: 2
    t.decimal  "lymphs",                            precision: 5, scale: 2
    t.decimal  "blasts",                            precision: 5, scale: 2
    t.decimal  "monos",                             precision: 5, scale: 2
    t.decimal  "debris",                            precision: 5, scale: 2
    t.decimal  "plasma_cells",                      precision: 5, scale: 2
    t.decimal  "other_cells",                       precision: 5, scale: 2
    t.decimal  "myelomonos",                        precision: 5, scale: 2
    t.decimal  "atypical",                          precision: 5, scale: 2
    t.decimal  "hematogomes",                       precision: 5, scale: 2
    t.string   "cellular_yield",      limit: 255
    t.text     "phenotype",           limit: 65535
    t.boolean  "display_on_report",                                         default: true
    t.decimal  "rbc_precursor",                     precision: 5, scale: 1
    t.decimal  "basos",                             precision: 5, scale: 1
    t.decimal  "total_t_cells",                     precision: 5, scale: 2
    t.integer  "total_t_cells_abs",   limit: 4
    t.decimal  "cd4_t_cells",                       precision: 5, scale: 2
    t.integer  "cd4_t_cells_abs",     limit: 4
    t.decimal  "cd8_t_cells",                       precision: 5, scale: 2
    t.integer  "cd8_t_cells_abs",     limit: 4
    t.decimal  "cd4_cd8_ratio",                     precision: 5, scale: 2
    t.decimal  "total_b_cells",                     precision: 5, scale: 2
    t.integer  "total_b_cells_abs",   limit: 4
    t.decimal  "kappa_b_cells",                     precision: 5, scale: 2
    t.integer  "kappa_b_cells_abs",   limit: 4
    t.decimal  "lambda_b_cells",                    precision: 5, scale: 2
    t.integer  "lambda_b_cells_abs",  limit: 4
    t.decimal  "total_nk_cells",                    precision: 5, scale: 2
    t.integer  "total_nk_cells_abs",  limit: 4
    t.string   "processing_lab_text", limit: 255
  end

  create_table "histo_grossing_options", force: :cascade do |t|
    t.string   "specimen_size",       limit: 255
    t.string   "specimen_color",      limit: 255
    t.integer  "number_of_pieces",    limit: 4
    t.integer  "number_of_cassettes", limit: 4
    t.integer  "number_of_slides",    limit: 4
    t.string   "medium",              limit: 255
    t.string   "cassette_label",      limit: 255
    t.string   "cycle",               limit: 255
    t.integer  "specimen_id",         limit: 4,   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "clarity",             limit: 255
    t.integer  "cassette_color_id",   limit: 4
    t.datetime "time_of_fixation"
    t.datetime "time_of_processing"
  end

  add_index "histo_grossing_options", ["specimen_id"], name: "index_histo_grossing_options_on_specimen_id", using: :btree

  create_table "histo_patient_histories", force: :cascade do |t|
    t.string   "collection_date",         limit: 255
    t.date     "dob"
    t.string   "accession_number",        limit: 20
    t.string   "first_name",              limit: 75
    t.string   "last_name",               limit: 75
    t.string   "middle_initial",          limit: 1
    t.string   "ordering_client_number",  limit: 50
    t.string   "ordering_client_city",    limit: 100
    t.string   "ordering_client_state",   limit: 20
    t.binary   "text",                    limit: 16777215
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "account_id",              limit: 4
    t.string   "sex",                     limit: 10
    t.datetime "final_reported_at"
    t.string   "physician_name",          limit: 100
    t.string   "ordering_client_name",    limit: 100
    t.string   "ordering_client_zip",     limit: 15
    t.string   "ordering_client_address", limit: 100
    t.string   "pid",                     limit: 100
    t.datetime "accession_date"
  end

  add_index "histo_patient_histories", ["accession_number"], name: "index_histo_patient_histories_on_accession_number", using: :btree
  add_index "histo_patient_histories", ["account_id"], name: "index_histo_patient_histories_on_account_id", using: :btree
  add_index "histo_patient_histories", ["last_name", "first_name", "account_id"], name: "histo_patient_search", using: :btree

  create_table "icd9_code_libraries", force: :cascade do |t|
    t.string   "code_number",       limit: 255
    t.string   "icd9_code",         limit: 255
    t.string   "validity",          limit: 255
    t.string   "short_description", limit: 255
    t.string   "long_description",  limit: 255
    t.string   "full_description",  limit: 255
    t.string   "status",            limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ihc_algorithms", force: :cascade do |t|
    t.string   "description",    limit: 255
    t.string   "algorithm_type", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ihc_specimen_results", force: :cascade do |t|
    t.integer  "specimen_id",           limit: 4
    t.text     "references",            limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "ihc_specimen_type_id",  limit: 4
    t.integer  "ihc_transport_type_id", limit: 4
  end

  create_table "ihc_specimen_types", force: :cascade do |t|
    t.string   "description", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ihc_summaries", force: :cascade do |t|
    t.integer  "case_id",                   limit: 4
    t.boolean  "include_on_report",                       default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "completed_on"
    t.integer  "completed_by",              limit: 4
    t.text     "summary_diagnosis",         limit: 65535
    t.text     "submitted_diagnosis",       limit: 65535
    t.text     "references",                limit: 65535
    t.boolean  "include_summary_diagnosis",               default: false
    t.datetime "signed_out_at"
    t.integer  "signed_out_by",             limit: 4
  end

  create_table "ihc_test_results", force: :cascade do |t|
    t.integer  "specimen_tests_specimen_id", limit: 4
    t.integer  "specimen_id",                limit: 4
    t.text     "result",                     limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "antibody_id",                limit: 4
    t.integer  "dx_classification_id",       limit: 4
    t.decimal  "percent_positive",                         precision: 5, scale: 2
    t.integer  "intensity",                  limit: 4
    t.string   "ratio",                      limit: 255
    t.boolean  "display_graph"
    t.boolean  "display_on_report",                                                default: true
    t.integer  "display_order",              limit: 4
    t.integer  "score",                      limit: 4
    t.integer  "specimen_test_id",           limit: 4
    t.integer  "specimen_image_id",          limit: 4
  end

  create_table "ihc_transport_types", force: :cascade do |t|
    t.string   "description", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "item_questions", force: :cascade do |t|
    t.integer  "questionnaire_id",   limit: 4
    t.string   "questionnaire_type", limit: 255
    t.integer  "question_order",     limit: 4
    t.integer  "question_id",        limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "category",           limit: 100
  end

  add_index "item_questions", ["question_id"], name: "index_item_questions_on_question_id", using: :btree
  add_index "item_questions", ["questionnaire_id", "questionnaire_type"], name: "iq_q_id_qt_ix", using: :btree

  create_table "labis_faqs", force: :cascade do |t|
    t.string   "title",       limit: 255
    t.text     "information", limit: 65535
    t.integer  "faq_order",   limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "labis_specimen_tps_case_specimens", force: :cascade do |t|
    t.integer  "specimen_id",               limit: 4,   null: false
    t.string   "tps_case_accession_number", limit: 255
    t.integer  "tps_specimen_number",       limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "list_values", force: :cascade do |t|
    t.string   "name",                          limit: 255
    t.boolean  "active",                                    default: true
    t.integer  "list_id",                       limit: 4
    t.integer  "account_id",                    limit: 4
    t.integer  "sort_order",                    limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "description",                   limit: 255
    t.boolean  "is_letter_required"
    t.integer  "send_letter_after",             limit: 4
    t.string   "color_code",                    limit: 10
    t.float    "image_guided_count",            limit: 24
    t.float    "manual_count",                  limit: 24
    t.float    "qa_count",                      limit: 24
    t.boolean  "retro_rescreen_required"
    t.boolean  "qa_rescreen_required"
    t.boolean  "pathologist_rescreen_required"
    t.integer  "ranking",                       limit: 4
  end

  add_index "list_values", ["active", "list_id", "account_id"], name: "index_list_values_on_active_and_list_id_and_account_id", using: :btree
  add_index "list_values", ["list_id", "account_id"], name: "index_list_values_on_list_id_and_account_id", using: :btree

  create_table "list_values_pap_reflex_rules", id: false, force: :cascade do |t|
    t.integer "list_value_id",      limit: 4
    t.integer "pap_reflex_rule_id", limit: 4
  end

  add_index "list_values_pap_reflex_rules", ["list_value_id", "pap_reflex_rule_id"], name: "reflex_bethesda_join_table", using: :btree

  create_table "lists", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "lists", ["name"], name: "pap_rptListParms", using: :btree

  create_table "location_logos", force: :cascade do |t|
    t.integer  "parent_id",    limit: 4
    t.string   "content_type", limit: 255
    t.string   "filename",     limit: 255
    t.string   "thumbnail",    limit: 255
    t.integer  "size",         limit: 4
    t.integer  "width",        limit: 4
    t.integer  "height",       limit: 4
    t.integer  "location_id",  limit: 4
    t.integer  "uploaded_by",  limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "location_logos", ["location_id"], name: "index_location_logos_on_location_id", using: :btree
  add_index "location_logos", ["parent_id"], name: "index_location_logos_on_parent_id", using: :btree

  create_table "locations", force: :cascade do |t|
    t.string   "address_one",         limit: 255,                 null: false
    t.string   "address_two",         limit: 255
    t.string   "city",                limit: 255,                 null: false
    t.string   "state",               limit: 2,                   null: false
    t.string   "zip",                 limit: 10,                  null: false
    t.string   "phone",               limit: 10,                  null: false
    t.string   "fax",                 limit: 10
    t.string   "clia",                limit: 255
    t.integer  "account_id",          limit: 4,                   null: false
    t.string   "location_name",       limit: 255,                 null: false
    t.boolean  "active",                          default: true
    t.string   "location_code",       limit: 255
    t.integer  "active_logo",         limit: 4
    t.boolean  "include_pms",                     default: false
    t.string   "pms_connection_type", limit: 255
    t.string   "pms_address",         limit: 255
    t.string   "pms_port",            limit: 255
    t.boolean  "smart_search"
    t.integer  "case_seed",           limit: 4,   default: 1
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "tps_id",              limit: 255
  end

  add_index "locations", ["account_id", "active"], name: "pathology_dashboard", using: :btree
  add_index "locations", ["account_id"], name: "index_locations_on_account_id", using: :btree

  create_table "marital_statuses", force: :cascade do |t|
    t.string   "description", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mediums", force: :cascade do |t|
    t.string "name", limit: 255
  end

  create_table "mercator_image_types", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mercators", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "morphology_cbc_results", force: :cascade do |t|
    t.integer  "cbc_code_id",           limit: 4
    t.integer  "morphology_summary_id", limit: 4
    t.float    "unit_measurement",      limit: 24
    t.float    "unit_percentage",       limit: 24
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "morphology_cbc_results", ["cbc_code_id"], name: "index_morphology_cbc_results_on_cbc_code_id", using: :btree
  add_index "morphology_cbc_results", ["morphology_summary_id"], name: "index_morphology_cbc_results_on_morphology_summary_id", using: :btree

  create_table "morphology_summaries", force: :cascade do |t|
    t.datetime "performed_at"
    t.boolean  "client_submitted",                   default: true
    t.text     "final_diagnosis",      limit: 65535
    t.integer  "dx_classification_id", limit: 4
    t.integer  "case_id",              limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "icd9_code",            limit: 255
  end

  add_index "morphology_summaries", ["case_id"], name: "index_morphology_summaries_on_case_id", using: :btree

  create_table "order_entry_answers", force: :cascade do |t|
    t.integer  "case_id",                 limit: 4
    t.integer  "order_entry_question_id", limit: 4
    t.string   "answer",                  limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "imported"
    t.integer  "clinical_observation_id", limit: 4
  end

  add_index "order_entry_answers", ["case_id", "order_entry_question_id"], name: "index_order_entry_answers_on_case_id_and_order_entry_question_id", using: :btree
  add_index "order_entry_answers", ["clinical_observation_id"], name: "index_order_entry_answers_on_clinical_observation_id", using: :btree

  create_table "order_entry_questions", force: :cascade do |t|
    t.integer  "case_type_id",                    limit: 4
    t.integer  "account_id",                      limit: 4
    t.string   "answer_type",                     limit: 255
    t.text     "question_text",                   limit: 65535
    t.boolean  "required"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "has_client_accounts"
    t.integer  "sort_order",                      limit: 4
    t.string   "clinical_observation_identifier", limit: 10
  end

  add_index "order_entry_questions", ["account_id", "case_type_id"], name: "index_order_entry_questions_on_account_id_and_case_type_id", using: :btree
  add_index "order_entry_questions", ["active"], name: "index_order_entry_questions_on_active", using: :btree
  add_index "order_entry_questions", ["clinical_observation_identifier"], name: "index_order_entry_questions_on_clinical_observation_identifier", using: :btree

  create_table "order_types", force: :cascade do |t|
    t.string "description", limit: 255
  end

  create_table "panel_probe_sets", force: :cascade do |t|
    t.integer  "specimen_test_id", limit: 4
    t.integer  "probe_set_id",     limit: 4
    t.string   "tps_id",           limit: 255
    t.text     "cut_offs",         limit: 65535
    t.string   "iscn",             limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "panel_probe_sets", ["probe_set_id"], name: "index_panel_probe_sets_on_probe_set_id", using: :btree
  add_index "panel_probe_sets", ["specimen_test_id"], name: "index_panel_probe_sets_on_specimen_test_id", using: :btree

  create_table "pap_histories", force: :cascade do |t|
    t.integer  "case_id",            limit: 4
    t.integer  "specimen_id",        limit: 4
    t.integer  "patient_id",         limit: 4
    t.integer  "pap_screen_id",      limit: 4
    t.integer  "user_id",            limit: 4
    t.string   "case_number",        limit: 255
    t.string   "bethesda",           limit: 255
    t.string   "adequacy",           limit: 255
    t.string   "released_by",        limit: 255
    t.string   "five_year_retro",    limit: 255
    t.datetime "collection_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "high_risk"
    t.datetime "released_at"
    t.boolean  "is_letter_required"
    t.datetime "send_letter_on"
    t.integer  "pap_dx_id",          limit: 4
    t.integer  "adequacy_id",        limit: 4
    t.datetime "letter_sent_on"
    t.boolean  "imported"
  end

  add_index "pap_histories", ["adequacy_id"], name: "index_pap_histories_on_adequacy_id", using: :btree
  add_index "pap_histories", ["case_id"], name: "index_pap_histories_on_case_id", using: :btree
  add_index "pap_histories", ["created_at"], name: "pap_OrderingProviderSummary", using: :btree
  add_index "pap_histories", ["pap_dx_id"], name: "index_pap_histories_on_pap_dx_id", using: :btree
  add_index "pap_histories", ["pap_screen_id"], name: "rptOrderingProviderSummaryXX", using: :btree
  add_index "pap_histories", ["patient_id", "collection_date"], name: "index_pap_histories_on_patient_id_and_collection_date", using: :btree
  add_index "pap_histories", ["patient_id", "high_risk"], name: "high_risk_patient", using: :btree
  add_index "pap_histories", ["released_at"], name: "pap_rptOrderingProviderLog", using: :btree

  create_table "pap_queues", force: :cascade do |t|
    t.string   "description", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pap_reflex_rules", force: :cascade do |t|
    t.integer  "client_account_id",         limit: 4
    t.integer  "physician_id",              limit: 4
    t.integer  "source_test_id",            limit: 4
    t.string   "source_test_external_code", limit: 255
    t.text     "source_test_description",   limit: 65535
    t.integer  "minimum_patient_age",       limit: 4
    t.integer  "maximum_patient_age",       limit: 4
    t.boolean  "is_active"
    t.integer  "created_by",                limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name",                      limit: 255
    t.boolean  "prompt_at_data_entry"
    t.integer  "case_type_id",              limit: 4
    t.boolean  "is_global"
    t.integer  "account_id",                limit: 4
    t.boolean  "report_unordered"
    t.text     "report_unordered_text",     limit: 65535
    t.string   "external_test_code",        limit: 10
  end

  add_index "pap_reflex_rules", ["client_account_id", "source_test_id"], name: "index_pap_reflex_rules_on_client_account_id_and_source_test_id", using: :btree
  add_index "pap_reflex_rules", ["created_by"], name: "index_pap_reflex_rules_on_created_by", using: :btree
  add_index "pap_reflex_rules", ["physician_id"], name: "index_pap_reflex_rules_on_physician_id", using: :btree

  create_table "pap_reflex_rules_specimen_tests", id: false, force: :cascade do |t|
    t.integer "specimen_test_id",   limit: 4
    t.integer "pap_reflex_rule_id", limit: 4
  end

  add_index "pap_reflex_rules_specimen_tests", ["specimen_test_id", "pap_reflex_rule_id"], name: "reflex_specimen_test_join_table", using: :btree

  create_table "pap_rescreens", force: :cascade do |t|
    t.integer  "pap_case_id",             limit: 4
    t.integer  "pap_screen_id",           limit: 4
    t.string   "case_number",             limit: 255
    t.string   "patient_name",            limit: 255
    t.integer  "pap_dx_id",               limit: 4
    t.string   "pap_dx_description",      limit: 255
    t.datetime "screened_on"
    t.string   "screened_by_user",        limit: 255
    t.integer  "screened_by",             limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "account_id",              limit: 4
    t.integer  "screen_type_id",          limit: 4
    t.string   "screen_type_description", limit: 255
    t.integer  "previous_pap_screen_id",  limit: 4
    t.integer  "completed_by",            limit: 4
    t.datetime "completed_on"
    t.string   "abnormal_case_number",    limit: 255
    t.datetime "signed_out_on"
  end

  add_index "pap_rescreens", ["account_id", "completed_on", "screen_type_id"], name: "papcasequeue", using: :btree
  add_index "pap_rescreens", ["created_at", "screen_type_description"], name: "rpt5yearLookBackPullList", using: :btree
  add_index "pap_rescreens", ["pap_case_id"], name: "index_pap_rescreens_on_pap_case_id", using: :btree
  add_index "pap_rescreens", ["pap_screen_id"], name: "rptPathologistLog", using: :btree
  add_index "pap_rescreens", ["previous_pap_screen_id"], name: "index_pap_rescreens_on_previous_pap_screen_id", using: :btree
  add_index "pap_rescreens", ["screened_by", "screen_type_description"], name: "rptParmsScreeners", using: :btree

  create_table "pap_screen_correlations", force: :cascade do |t|
    t.boolean  "unavailable"
    t.datetime "biopsy_taken_on"
    t.string   "biopsy_type",     limit: 255
    t.string   "location",        limit: 255
    t.integer  "dx_pap_id",       limit: 4
    t.text     "comments",        limit: 65535
    t.integer  "case_id",         limit: 4
    t.integer  "user_id",         limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "pap_screen_id",   limit: 4
  end

  add_index "pap_screen_correlations", ["case_id"], name: "index_pap_screen_correlations_on_case_id", using: :btree
  add_index "pap_screen_correlations", ["pap_screen_id"], name: "index_pap_screen_correlations_on_pap_screen_id", using: :btree

  create_table "pap_screens", force: :cascade do |t|
    t.integer  "pathologist_id",         limit: 4
    t.integer  "cytologist_id",          limit: 4
    t.integer  "specimen_id",            limit: 4
    t.integer  "case_id",                limit: 4
    t.boolean  "review"
    t.boolean  "image_guided"
    t.integer  "pap_dx_id",              limit: 4
    t.integer  "adequacy_id",            limit: 4
    t.text     "clinical_information",   limit: 65535
    t.text     "comments",               limit: 65535
    t.string   "icd9_code",              limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "pap_dx_description",     limit: 65535
    t.text     "adequacy_description",   limit: 65535
    t.integer  "patient_id",             limit: 4
    t.boolean  "is_initial"
    t.boolean  "is_review"
    t.boolean  "is_final"
    t.integer  "reviewer_id",            limit: 4
    t.integer  "control_code_id",        limit: 4
    t.text     "infection",              limit: 65535
    t.decimal  "list_value_discrepancy",               precision: 10
    t.boolean  "is_letter_required"
    t.datetime "send_letter_on"
    t.boolean  "signed_out"
    t.float    "slide_count",            limit: 24
    t.boolean  "is_retro"
    t.string   "rescreen",               limit: 30
    t.datetime "letter_sent_on"
    t.datetime "completed_at"
    t.boolean  "randomly_flagged"
    t.integer  "retro_finding_id",       limit: 4
    t.string   "pap_dx_external_code",   limit: 20
    t.string   "adequacy_external_code", limit: 20
    t.integer  "retro_screener_id",      limit: 4
    t.integer  "physical_slide_count",   limit: 4
    t.boolean  "imported"
  end

  add_index "pap_screens", ["case_id", "is_final"], name: "pap_rptOrderingProviderLog", using: :btree
  add_index "pap_screens", ["case_id", "is_initial", "specimen_id", "pap_dx_id", "cytologist_id", "created_at", "adequacy_id"], name: "pap_rptCytotechomologistLog", using: :btree
  add_index "pap_screens", ["case_id", "is_review", "pap_dx_id", "reviewer_id"], name: "pap_rptCytotechomologistLog2", using: :btree
  add_index "pap_screens", ["case_id", "specimen_id", "adequacy_id", "cytologist_id", "pap_dx_id", "created_at", "is_initial"], name: "rptCytotechomologistLog", using: :btree
  add_index "pap_screens", ["completed_at", "signed_out", "review", "cytologist_id"], name: "qaRescreencountIdx", using: :btree
  add_index "pap_screens", ["created_at", "adequacy_id", "pap_dx_id"], name: "rptOrderingProviderSummaryXX", using: :btree
  add_index "pap_screens", ["is_final"], name: "index_pap_screens_on_is_final", using: :btree
  add_index "pap_screens", ["is_initial"], name: "index_pap_screens_on_is_initial", using: :btree
  add_index "pap_screens", ["is_review"], name: "index_pap_screens_on_is_review", using: :btree
  add_index "pap_screens", ["patient_id"], name: "index_pap_screens_on_patient_id", using: :btree
  add_index "pap_screens", ["retro_finding_id"], name: "index_pap_screens_on_retro_finding_id", using: :btree
  add_index "pap_screens", ["retro_screener_id"], name: "index_pap_screens_on_retro_screener_id", using: :btree
  add_index "pap_screens", ["reviewer_id"], name: "index_pap_screens_on_reviewer_id", using: :btree
  add_index "pap_screens", ["specimen_id"], name: "index_pap_screens_on_specimen_id", using: :btree

  create_table "pathologist_sign_out_codes", force: :cascade do |t|
    t.integer  "external_test_code_id", limit: 4
    t.string   "cpt_code",              limit: 255
    t.string   "description",           limit: 255
    t.integer  "units",                 limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pathologist_sign_out_codes", ["external_test_code_id"], name: "index_pathologist_sign_out_codes_on_external_test_code_id", using: :btree

  create_table "patient_insurances", force: :cascade do |t|
    t.integer  "patient_id",      limit: 4,   null: false
    t.string   "company_name",    limit: 100
    t.string   "insured_name",    limit: 100
    t.string   "relationship",    limit: 20
    t.string   "address_one",     limit: 200
    t.string   "address_two",     limit: 200
    t.string   "city",            limit: 100
    t.string   "state",           limit: 2
    t.string   "zip",             limit: 10
    t.string   "member_id",       limit: 50
    t.string   "group_number",    limit: 50
    t.string   "employer",        limit: 100
    t.string   "insurance_level", limit: 50
    t.string   "phone",           limit: 10
    t.string   "insured_ssn",     limit: 11
    t.datetime "insured_dob"
    t.string   "plan_number",     limit: 50
    t.string   "insurance_code",  limit: 50
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "patient_insurances", ["patient_id"], name: "index_patient_insurances_on_patient_id", using: :btree

  create_table "patients", force: :cascade do |t|
    t.string   "first_name",          limit: 35,  null: false
    t.string   "last_name",           limit: 35,  null: false
    t.string   "middle_initial",      limit: 1
    t.datetime "dob"
    t.string   "gender",              limit: 255
    t.string   "ssn",                 limit: 11
    t.string   "marital_status",      limit: 255
    t.string   "height",              limit: 255
    t.string   "weight",              limit: 255
    t.string   "address_one",         limit: 255
    t.string   "address_two",         limit: 255
    t.string   "city",                limit: 255
    t.string   "state",               limit: 2
    t.string   "zip",                 limit: 10
    t.string   "phone",               limit: 10
    t.string   "fax",                 limit: 10
    t.integer  "account_id",          limit: 4,   null: false
    t.string   "race",                limit: 255
    t.string   "tps_id",              limit: 36
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "external_patient_id", limit: 255
    t.datetime "high_risk_expires"
    t.boolean  "is_high_risk"
    t.boolean  "imported"
  end

  add_index "patients", ["account_id", "dob"], name: "index_patients_on_account_id_and_dob", using: :btree
  add_index "patients", ["account_id", "ssn"], name: "index_patients_on_account_id_and_ssn", using: :btree
  add_index "patients", ["account_id"], name: "index_patients_on_account_id", using: :btree
  add_index "patients", ["first_name", "last_name"], name: "index_patients_on_first_name_and_last_name", using: :btree
  add_index "patients", ["first_name", "last_name"], name: "patient_name_search", type: :fulltext

  create_table "patients_client_accounts", force: :cascade do |t|
    t.integer  "patient_id",                limit: 4
    t.integer  "client_account_id",         limit: 4
    t.integer  "case_id",                   limit: 4
    t.integer  "order_id",                  limit: 4
    t.string   "client_patient_identifier", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "patients_client_accounts", ["client_account_id", "patient_id"], name: "pca_idx", using: :btree
  add_index "patients_client_accounts", ["order_id"], name: "index_patients_client_accounts_on_order_id", using: :btree

  create_table "payer_plans", force: :cascade do |t|
    t.string   "plan_name",   limit: 255
    t.string   "description", limit: 255
    t.string   "plan_number", limit: 255
    t.boolean  "active",                  default: true
    t.integer  "payer_id",    limit: 4,                  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "payer_plans", ["payer_id"], name: "index_payer_plans_on_payer_id", using: :btree

  create_table "payers", force: :cascade do |t|
    t.string   "company_name",       limit: 100
    t.string   "street_address",     limit: 200
    t.string   "address_2",          limit: 200
    t.string   "city",               limit: 100
    t.string   "state",              limit: 2
    t.string   "zip",                limit: 10
    t.boolean  "active",                           default: true
    t.string   "insurance_code",     limit: 50
    t.string   "contact_first_name", limit: 100
    t.string   "contact_last_name",  limit: 100
    t.string   "contact_number",     limit: 50
    t.string   "contact_fax",        limit: 10
    t.string   "contact_email",      limit: 100
    t.string   "company_phone",      limit: 10
    t.string   "website",            limit: 200
    t.text     "comments",           limit: 65535
    t.integer  "account_id",         limit: 4,                    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "payers", ["account_id"], name: "index_payers_on_account_id", using: :btree

  create_table "permission_categories", force: :cascade do |t|
    t.string   "description", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "permissions", force: :cascade do |t|
    t.string   "description",            limit: 255
    t.integer  "permission_category_id", limit: 4
    t.text     "tooltip",                limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "permissions_roles", id: false, force: :cascade do |t|
    t.integer "role_id",       limit: 4, null: false
    t.integer "permission_id", limit: 4, null: false
  end

  add_index "permissions_roles", ["role_id", "permission_id"], name: "index_permissions_roles_on_role_id_and_permission_id", using: :btree

  create_table "print_batches", force: :cascade do |t|
    t.integer  "account_id", limit: 4
    t.string   "jobs",       limit: 255
    t.integer  "printed_by", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "print_delivery_jobs", force: :cascade do |t|
    t.integer  "report_id",           limit: 4
    t.integer  "account_id",          limit: 4
    t.string   "destination",         limit: 255
    t.integer  "rule_id",             limit: 4
    t.integer  "copies",              limit: 4
    t.string   "client_account_name", limit: 255
    t.boolean  "processed",                       default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "processed_at"
    t.integer  "processed_by",        limit: 4
  end

  create_table "priorities", force: :cascade do |t|
    t.string   "description", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "probe_set_results", force: :cascade do |t|
    t.integer  "probe_set_id",                  limit: 4
    t.integer  "fish_oncology_panel_result_id", limit: 4
    t.integer  "specimen_id",                   limit: 4
    t.string   "probe_set_name",                limit: 255
    t.integer  "sort_order",                    limit: 4
    t.integer  "total_cells",                   limit: 4
    t.integer  "image_1_id",                    limit: 4
    t.integer  "image_2_id",                    limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "tps_id",                        limit: 255
  end

  add_index "probe_set_results", ["fish_oncology_panel_result_id"], name: "index_probe_set_results_on_fish_oncology_panel_result_id", using: :btree
  add_index "probe_set_results", ["probe_set_id"], name: "index_probe_set_results_on_probe_set_id", using: :btree
  add_index "probe_set_results", ["specimen_id"], name: "index_probe_set_results_on_specimen_id", using: :btree
  add_index "probe_set_results", ["tps_id"], name: "index_probe_set_results_on_tps_id", using: :btree

  create_table "probe_sets", force: :cascade do |t|
    t.string   "name",                      limit: 255
    t.integer  "sort_order",                limit: 4
    t.string   "tps_id",                    limit: 255
    t.string   "iscn",                      limit: 255
    t.boolean  "display_individual_probes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "probe_sets_probes", id: false, force: :cascade do |t|
    t.integer "probe_set_id", limit: 4
    t.integer "probe_id",     limit: 4
  end

  add_index "probe_sets_probes", ["probe_set_id", "probe_id"], name: "index_probe_sets_probes_on_probe_set_id_and_probe_id", using: :btree

  create_table "probes", force: :cascade do |t|
    t.string   "tps_id",     limit: 255
    t.string   "name",       limit: 255
    t.text     "cut_off",    limit: 65535
    t.string   "iscn",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "prostate_results", force: :cascade do |t|
    t.boolean  "hgpin"
    t.float    "pti",          limit: 24
    t.integer  "gleason_one",  limit: 4
    t.integer  "gleason_two",  limit: 4
    t.integer  "completed_by", limit: 4
    t.datetime "completed_at"
    t.integer  "specimen_id",  limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "prostate_results", ["specimen_id"], name: "index_prostate_results_on_specimen_id", using: :btree

  create_table "qa_categories", force: :cascade do |t|
    t.string   "description", limit: 255
    t.integer  "parent_id",   limit: 4
    t.integer  "account_id",  limit: 4,   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "qa_categories", ["account_id"], name: "index_qa_categories_on_account_id", using: :btree
  add_index "qa_categories", ["parent_id"], name: "index_qa_categories_on_parent_id", using: :btree

  create_table "qa_flags", force: :cascade do |t|
    t.integer  "qa_category_id",       limit: 4,                   null: false
    t.string   "title",                limit: 255
    t.string   "description",          limit: 255
    t.boolean  "lock_case",                        default: false
    t.string   "suggested_resolution", limit: 255
    t.boolean  "pre_analytical",                   default: false
    t.boolean  "post_analytical",                  default: false
    t.boolean  "analytical",                       default: false
    t.boolean  "active",                           default: true
    t.boolean  "hidden",                           default: false
    t.boolean  "is_readonly",                      default: false
    t.integer  "account_id",           limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "qa_flags", ["account_id"], name: "index_qa_flags_on_account_id", using: :btree
  add_index "qa_flags", ["qa_category_id"], name: "index_qa_flags_on_qa_category_id", using: :btree

  create_table "qa_incidents", force: :cascade do |t|
    t.integer  "qa_flag_id",         limit: 4
    t.integer  "account_id",         limit: 4,                   null: false
    t.integer  "logged_by",          limit: 4
    t.string   "case_number",        limit: 255
    t.string   "requisition_number", limit: 255
    t.string   "client_name",        limit: 255
    t.string   "physician_name",     limit: 255
    t.string   "patient_name",       limit: 255
    t.integer  "specimen_type_id",   limit: 4
    t.integer  "number_of_items",    limit: 4
    t.string   "sent_to",            limit: 255
    t.string   "sent_by",            limit: 255
    t.datetime "returned_to_lab_at"
    t.string   "comments",           limit: 255
    t.string   "description",        limit: 255
    t.integer  "resolved_by",        limit: 4
    t.boolean  "is_resolved",                    default: false
    t.datetime "resolved_at"
    t.integer  "case_type_id",       limit: 4
    t.boolean  "active",                         default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "qa_incidents", ["account_id"], name: "index_qa_incidents_on_account_id", using: :btree
  add_index "qa_incidents", ["case_type_id"], name: "index_qa_incidents_on_case_type_id", using: :btree
  add_index "qa_incidents", ["logged_by"], name: "index_qa_incidents_on_logged_by", using: :btree
  add_index "qa_incidents", ["qa_flag_id"], name: "index_qa_incidents_on_qa_flag_id", using: :btree
  add_index "qa_incidents", ["specimen_type_id"], name: "index_qa_incidents_on_specimen_type_id", using: :btree

  create_table "qa_item_notes", force: :cascade do |t|
    t.integer  "item_id",       limit: 4,                     null: false
    t.integer  "user_id",       limit: 4,                     null: false
    t.string   "subject",       limit: 255
    t.text     "note",          limit: 65535
    t.boolean  "incident_note",               default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "question_types", force: :cascade do |t|
    t.string   "description", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "questionables", force: :cascade do |t|
    t.string   "description", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "questions", force: :cascade do |t|
    t.integer  "question_type_id", limit: 4
    t.text     "title",            limit: 65535
    t.text     "question_text",    limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "required",                       default: false
    t.string   "validation",       limit: 50
    t.string   "default_answer",   limit: 255
    t.boolean  "active"
  end

  add_index "questions", ["question_type_id"], name: "index_questions_on_question_type_id", using: :btree

  create_table "races", force: :cascade do |t|
    t.string   "description",     limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "hl7_code",        limit: 255
    t.string   "hl7_description", limit: 255
    t.string   "hl7_table_id",    limit: 255
  end

  add_index "races", ["hl7_code"], name: "index_races_on_hl7_code", using: :btree
  add_index "races", ["hl7_description"], name: "index_races_on_hl7_description", using: :btree
  add_index "races", ["hl7_table_id"], name: "index_races_on_hl7_table_id", using: :btree

  create_table "referring_physicians", force: :cascade do |t|
    t.string   "first_name",        limit: 255,                 null: false
    t.string   "middle_initial",    limit: 1
    t.string   "last_name",         limit: 255,                 null: false
    t.integer  "client_account_id", limit: 4,                   null: false
    t.string   "address_one",       limit: 255
    t.string   "address_two",       limit: 255
    t.string   "city",              limit: 255
    t.boolean  "is_active",                     default: true
    t.string   "state",             limit: 2
    t.string   "zip",               limit: 10
    t.string   "phone",             limit: 10
    t.string   "fax",               limit: 10
    t.boolean  "is_fax",                        default: false
    t.boolean  "is_usmail",                     default: false
    t.boolean  "active",                        default: true
    t.string   "tps_id",            limit: 36
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_courier",                    default: false
    t.boolean  "is_fedex",                      default: false
  end

  add_index "referring_physicians", ["client_account_id"], name: "index_referring_physicians_on_client_account_id", using: :btree

  create_table "regate_requests", force: :cascade do |t|
    t.integer  "specimen_id",         limit: 4
    t.text     "markers",             limit: 65535
    t.text     "additional_comments", limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "specimen_image_id",   limit: 4
  end

  create_table "relationships", force: :cascade do |t|
    t.string   "description", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "report_templates", force: :cascade do |t|
    t.string   "description",   limit: 255
    t.string   "template_guid", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "account_id",    limit: 4
    t.string   "display_name",  limit: 255
  end

  add_index "report_templates", ["account_id"], name: "index_report_templates_on_account_id", using: :btree
  add_index "report_templates", ["display_name"], name: "index_report_templates_on_display_name", using: :btree

  create_table "report_types", force: :cascade do |t|
    t.string   "description", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reports", force: :cascade do |t|
    t.integer  "case_id",             limit: 4,                   null: false
    t.string   "document",            limit: 255,                 null: false
    t.integer  "report_type_id",      limit: 4,                   null: false
    t.boolean  "active"
    t.datetime "date_reported"
    t.integer  "user_id",             limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "viewed",                          default: false
    t.datetime "viewed_at"
    t.integer  "viewed_by",           limit: 4
    t.boolean  "printed",                         default: false
    t.datetime "printed_at"
    t.boolean  "is_deliverable",                  default: true
    t.boolean  "is_delivered",                    default: false
    t.datetime "milled_at"
    t.boolean  "process_immediately",             default: false
  end

  add_index "reports", ["case_id"], name: "index_reports_on_case_id", using: :btree

  create_table "result_codes", force: :cascade do |t|
    t.integer  "account_id",            limit: 4
    t.string   "clinical_result_field", limit: 255
    t.string   "result_code",           limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "result_codes", ["account_id"], name: "index_result_codes_on_account_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "description", limit: 255
    t.integer  "account_id",  limit: 4,                  null: false
    t.boolean  "can_edit",                default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["account_id"], name: "index_roles_on_account_id", using: :btree

  create_table "roles_users", id: false, force: :cascade do |t|
    t.integer "role_id", limit: 4, null: false
    t.integer "user_id", limit: 4, null: false
  end

  add_index "roles_users", ["user_id", "role_id"], name: "index_roles_users_on_user_id_and_role_id", using: :btree

  create_table "screen_types", force: :cascade do |t|
    t.string   "description",  limit: 255
    t.integer  "pap_queue_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "screen_types", ["pap_queue_id"], name: "index_screen_types_on_pap_queue_id", using: :btree

  create_table "sessions", force: :cascade do |t|
    t.string   "session_id", limit: 255,        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "data",       limit: 4294967295
  end

  add_index "sessions", ["session_id"], name: "index_sessions_on_session_id", using: :btree
  add_index "sessions", ["updated_at"], name: "index_sessions_on_updated_at", using: :btree

  create_table "signal_pattern_results", force: :cascade do |t|
    t.integer  "signal_pattern_id",    limit: 4
    t.integer  "probe_set_result_id",  limit: 4
    t.string   "signal_pattern_name",  limit: 255
    t.text     "cut_off",              limit: 65535
    t.integer  "cells",                limit: 4
    t.float    "percentage",           limit: 24
    t.integer  "percentage_precision", limit: 4
    t.integer  "sort_order",           limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "tps_id",               limit: 255
  end

  add_index "signal_pattern_results", ["probe_set_result_id"], name: "index_signal_pattern_results_on_probe_set_result_id", using: :btree
  add_index "signal_pattern_results", ["signal_pattern_id"], name: "index_signal_pattern_results_on_signal_pattern_id", using: :btree
  add_index "signal_pattern_results", ["tps_id"], name: "index_signal_pattern_results_on_tps_id", using: :btree

  create_table "signal_patterns", force: :cascade do |t|
    t.integer  "probe_set_id",         limit: 4
    t.integer  "specimen_type_id",     limit: 4
    t.string   "name",                 limit: 255
    t.text     "cut_off",              limit: 65535
    t.integer  "percentage_precision", limit: 4
    t.integer  "sort_order",           limit: 4
    t.string   "tps_id",               limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "signal_patterns", ["probe_set_id"], name: "index_signal_patterns_on_probe_set_id", using: :btree
  add_index "signal_patterns", ["specimen_type_id"], name: "index_signal_patterns_on_specimen_type_id", using: :btree

  create_table "special_procedures_orders", force: :cascade do |t|
    t.integer  "account_id",     limit: 4,     null: false
    t.integer  "specimen_id",    limit: 4,     null: false
    t.string   "order_type",     limit: 255
    t.string   "current_status", limit: 255
    t.string   "ordered_by",     limit: 255
    t.text     "notes",          limit: 65535
    t.integer  "priority_id",    limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "special_procedures_orders", ["account_id"], name: "index_special_procedures_orders_on_account_id", using: :btree
  add_index "special_procedures_orders", ["ordered_by"], name: "index_special_procedures_orders_on_ordered_by", using: :btree
  add_index "special_procedures_orders", ["priority_id"], name: "index_special_procedures_orders_on_priority_id", using: :btree
  add_index "special_procedures_orders", ["specimen_id"], name: "index_special_procedures_orders_on_specimen_id", using: :btree

  create_table "specialties", force: :cascade do |t|
    t.string   "description", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "specimen_blocks", force: :cascade do |t|
    t.integer  "specimen_id",       limit: 4
    t.string   "barcode",           limit: 255
    t.boolean  "exhausted"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "identifier",        limit: 255
    t.integer  "cassette_color_id", limit: 4
  end

  create_table "specimen_clarities", force: :cascade do |t|
    t.string   "description", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "specimen_colors", force: :cascade do |t|
    t.string   "description", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "specimen_cycles", force: :cascade do |t|
    t.string "name", limit: 255
  end

  create_table "specimen_images", force: :cascade do |t|
    t.integer  "parent_id",         limit: 4
    t.string   "content_type",      limit: 255
    t.string   "filename",          limit: 255
    t.string   "thumbnail",         limit: 255
    t.integer  "size",              limit: 4
    t.integer  "width",             limit: 4
    t.integer  "height",            limit: 4
    t.integer  "specimen_id",       limit: 4
    t.integer  "updated_by",        limit: 4
    t.string   "description",       limit: 255
    t.string   "image_type",        limit: 255
    t.boolean  "view_on_report"
    t.string   "caption",           limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "report_region_xml", limit: 65535
    t.string   "source",            limit: 255
    t.integer  "specimen_test_id",  limit: 4
    t.boolean  "view_on_summary",                 default: true
    t.string   "tps_id",            limit: 255
  end

  add_index "specimen_images", ["parent_id"], name: "index_specimen_images_on_parent_id", using: :btree
  add_index "specimen_images", ["specimen_id"], name: "index_specimen_images_on_specimen_id", using: :btree
  add_index "specimen_images", ["tps_id"], name: "index_specimen_images_on_tps_id", using: :btree

  create_table "specimen_slide_labels", force: :cascade do |t|
    t.integer  "specimen_id", limit: 4
    t.string   "block_label", limit: 255
    t.string   "stain_label", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "body_site",   limit: 255
  end

  add_index "specimen_slide_labels", ["specimen_id"], name: "index_specimen_slide_labels_on_specimen_id", using: :btree

  create_table "specimen_test_categories", force: :cascade do |t|
    t.string   "description", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "specimen_test_categories", ["description"], name: "index_specimen_test_categories_on_description", using: :btree

  create_table "specimen_test_orders", force: :cascade do |t|
    t.integer "specimen_id",      limit: 4
    t.integer "specimen_test_id", limit: 4
  end

  add_index "specimen_test_orders", ["specimen_id", "specimen_test_id"], name: "index_specimen_test_orders_on_specimen_id_and_specimen_test_id", using: :btree

  create_table "specimen_test_panel_components", force: :cascade do |t|
    t.integer  "specimen_test_panel_id", limit: 4, null: false
    t.integer  "specimen_test_id",       limit: 4, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "units",                  limit: 4
  end

  add_index "specimen_test_panel_components", ["specimen_test_panel_id"], name: "index_specimen_test_panel_components_on_specimen_test_panel_id", using: :btree

  create_table "specimen_test_results", force: :cascade do |t|
    t.integer  "dx_classification_id",     limit: 4
    t.text     "microscopic_description",  limit: 65535
    t.text     "diagnosis",                limit: 65535
    t.text     "comments",                 limit: 65535
    t.string   "icd9_code",                limit: 255
    t.boolean  "is_insitu"
    t.integer  "specimen_id",              limit: 4,     null: false
    t.string   "icd9_stack",               limit: 255
    t.integer  "dx_sub_classification_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "specimen_test_results", ["specimen_id"], name: "index_specimen_test_results_on_specimen_id", using: :btree

  create_table "specimen_test_types", force: :cascade do |t|
    t.string   "description", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title",       limit: 255
  end

  create_table "specimen_tests", force: :cascade do |t|
    t.string   "test_code",                 limit: 255
    t.string   "description",               limit: 255
    t.string   "cpt_code",                  limit: 7
    t.boolean  "active",                                default: true
    t.boolean  "is_panel",                              default: false
    t.integer  "specimen_test_type_id",     limit: 4
    t.integer  "bolt_on_type_id",           limit: 4
    t.boolean  "global",                                default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "tc_test"
    t.boolean  "full_test"
    t.integer  "specimen_test_category_id", limit: 4
    t.string   "tps_case_type_id",          limit: 255
    t.string   "tps_id",                    limit: 255
    t.boolean  "new_case",                              default: false
    t.string   "test_clone",                limit: 50
    t.string   "references",                limit: 400
    t.string   "abbreviation",              limit: 255
    t.boolean  "include_in_eorder"
    t.string   "interface_result_code",     limit: 255
    t.integer  "disclaimer_id",             limit: 4
    t.integer  "is_cocktail",               limit: 1
    t.string   "external_test_code",        limit: 15
    t.boolean  "image_guided"
    t.boolean  "show_in_procedure_queue",               default: true
  end

  add_index "specimen_tests", ["external_test_code"], name: "index_specimen_tests_on_external_test_code", using: :btree
  add_index "specimen_tests", ["specimen_test_type_id"], name: "index_specimen_tests_on_specimen_test_type_id", using: :btree

  create_table "specimen_tests_specimens", force: :cascade do |t|
    t.integer  "specimen_id",                 limit: 4,                         null: false
    t.integer  "specimen_test_id",            limit: 4,                         null: false
    t.integer  "special_procedures_order_id", limit: 4
    t.string   "part_number",                 limit: 255
    t.integer  "number_of_units",             limit: 4
    t.text     "notes",                       limit: 65535
    t.string   "current_status",              limit: 255,   default: "Pending"
    t.integer  "assigned_to",                 limit: 4
    t.datetime "completed_on"
    t.integer  "completed_by",                limit: 4
    t.boolean  "added_to_billing",                          default: false
    t.integer  "account_id",                  limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "added_by_default",                          default: false
    t.boolean  "added_by_preorder",                         default: false
    t.integer  "electronic_order_id",         limit: 4
  end

  add_index "specimen_tests_specimens", ["account_id"], name: "index_specimen_tests_specimens_on_account_id", using: :btree
  add_index "specimen_tests_specimens", ["added_by_default"], name: "index_specimen_tests_specimens_on_added_by_default", using: :btree
  add_index "specimen_tests_specimens", ["assigned_to"], name: "index_specimen_tests_specimens_on_assigned_to", using: :btree
  add_index "specimen_tests_specimens", ["completed_on"], name: "index_specimen_tests_specimens_on_completed_on", using: :btree
  add_index "specimen_tests_specimens", ["current_status"], name: "index_specimen_tests_specimens_on_current_status", length: {"current_status"=>1}, using: :btree
  add_index "specimen_tests_specimens", ["electronic_order_id"], name: "index_specimen_tests_specimens_on_electronic_order_id", using: :btree
  add_index "specimen_tests_specimens", ["special_procedures_order_id"], name: "index_specimen_tests_specimens_on_special_procedures_order_id", using: :btree
  add_index "specimen_tests_specimens", ["specimen_id", "specimen_test_id"], name: "sts_s_id_st_id_ix", using: :btree

  create_table "specimen_types", force: :cascade do |t|
    t.string   "description",               limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "tps_id",                    limit: 255
    t.string   "pc_tps_id",                 limit: 255
    t.string   "label_template_guid",       limit: 40
    t.string   "slide_label_template_guid", limit: 40
    t.boolean  "image_guided"
    t.integer  "account_id",                limit: 4
  end

  add_index "specimen_types", ["account_id"], name: "index_specimen_types_on_account_id", using: :btree

  create_table "specimen_types_tests", force: :cascade do |t|
    t.integer  "specimen_type_id", limit: 4,                 null: false
    t.integer  "specimen_test_id", limit: 4,                 null: false
    t.boolean  "is_default",                 default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "case_type_id",     limit: 4
  end

  add_index "specimen_types_tests", ["specimen_test_id", "specimen_type_id"], name: "sts_ste_id_sty_id_ix", using: :btree
  add_index "specimen_types_tests", ["specimen_type_id", "specimen_test_id"], name: "sts_sty_id_ste_id_ix", using: :btree

  create_table "specimen_types_variable_fields", id: false, force: :cascade do |t|
    t.integer "specimen_type_id",  limit: 4
    t.integer "variable_field_id", limit: 4
  end

  add_index "specimen_types_variable_fields", ["specimen_type_id", "variable_field_id"], name: "stvf_sty_id_vf_id_ix", using: :btree

  create_table "specimens", force: :cascade do |t|
    t.integer  "case_id",               limit: 4,                     null: false
    t.integer  "specimen_type_id",      limit: 4,                     null: false
    t.integer  "body_site_id",          limit: 4,                     null: false
    t.text     "body_site_description", limit: 65535
    t.text     "notes",                 limit: 65535
    t.string   "label",                 limit: 255
    t.text     "gross_description",     limit: 65535
    t.boolean  "is_processed",                        default: false
    t.integer  "updated_by",            limit: 4
    t.text     "comments",              limit: 65535
    t.integer  "number",                limit: 4
    t.string   "tps_id",                limit: 36
    t.integer  "digital_slides_count",  limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "number_of_blocks",      limit: 4
    t.boolean  "imported"
  end

  add_index "specimens", ["body_site_id"], name: "index_specimens_on_body_site_id", using: :btree
  add_index "specimens", ["case_id"], name: "index_specimens_on_case_id", using: :btree
  add_index "specimens", ["digital_slides_count"], name: "index_specimens_on_digital_slides_count", using: :btree

  create_table "stain_preorder_preferences", force: :cascade do |t|
    t.integer  "case_type_id",                limit: 4
    t.integer  "specimen_type_id",            limit: 4
    t.integer  "body_site_id",                limit: 4
    t.integer  "client_account_location_id",  limit: 4
    t.integer  "client_account_physician_id", limit: 4
    t.integer  "account_id",                  limit: 4
    t.integer  "created_by",                  limit: 4
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "deleted"
  end

  add_index "stain_preorder_preferences", ["account_id"], name: "index_stain_preorder_preferences_on_account_id", using: :btree
  add_index "stain_preorder_preferences", ["body_site_id"], name: "index_stain_preorder_preferences_on_body_site_id", using: :btree
  add_index "stain_preorder_preferences", ["case_type_id"], name: "index_stain_preorder_preferences_on_case_type_id", using: :btree
  add_index "stain_preorder_preferences", ["client_account_location_id"], name: "index_stain_preorder_preferences_on_client_account_location_id", using: :btree
  add_index "stain_preorder_preferences", ["client_account_physician_id"], name: "index_stain_preorder_preferences_on_client_account_physician_id", using: :btree
  add_index "stain_preorder_preferences", ["specimen_type_id"], name: "index_stain_preorder_preferences_on_specimen_type_id", using: :btree

  create_table "stain_preorder_preferences_tests", force: :cascade do |t|
    t.integer  "stain_preorder_preference_id", limit: 4
    t.integer  "specimen_test_id",             limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stain_statistics", force: :cascade do |t|
    t.integer  "case_type_id",     limit: 4
    t.integer  "specimen_type_id", limit: 4
    t.integer  "specimen_test_id", limit: 4
    t.integer  "user_id",          limit: 4
    t.integer  "account_id",       limit: 4
    t.datetime "order_date"
  end

  add_index "stain_statistics", ["case_type_id", "specimen_type_id", "specimen_test_id", "order_date"], name: "index_on_case_specimen_types_test_id_order_date", using: :btree
  add_index "stain_statistics", ["specimen_type_id", "account_id"], name: "index_on_specimen_type_account_ids", using: :btree
  add_index "stain_statistics", ["specimen_type_id", "user_id", "account_id"], name: "index_on_specimen_type_user_account_ids", using: :btree
  add_index "stain_statistics", ["specimen_type_id"], name: "index_on_specimen_type_id", using: :btree

  create_table "state_cancer_registry_codes", force: :cascade do |t|
    t.string "ICD9_code", limit: 255
  end

  add_index "state_cancer_registry_codes", ["ICD9_code"], name: "pap_UsersByRoleParms", using: :btree

  create_table "states", force: :cascade do |t|
    t.string "name",         limit: 50, null: false
    t.string "abbreviation", limit: 2,  null: false
  end

  create_table "support_categories", force: :cascade do |t|
    t.string   "description", limit: 255
    t.string   "email",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "support_users", force: :cascade do |t|
    t.string   "username",                      limit: 255
    t.string   "first_name",                    limit: 255
    t.string   "last_name",                     limit: 255
    t.string   "password",                      limit: 255
    t.string   "password_salt",                 limit: 255
    t.boolean  "active",                                    default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                         limit: 255
    t.string   "password_reset_key",            limit: 255
    t.datetime "password_reset_key_expiration"
  end

  create_table "tc_cases", force: :cascade do |t|
    t.integer  "case_type_id",         limit: 4
    t.string   "patient_first_name",   limit: 50
    t.string   "patient_last_name",    limit: 50
    t.datetime "dob"
    t.string   "ssn",                  limit: 255
    t.string   "client_name",          limit: 255
    t.integer  "condition_id",         limit: 4
    t.string   "req_number",           limit: 255
    t.string   "lab_reference_number", limit: 255
    t.integer  "account_id",           limit: 4
    t.integer  "case_id",              limit: 4
    t.string   "tps_case_id",          limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tc_cases", ["condition_id", "account_id"], name: "pathology_dashboard", using: :btree

  create_table "tps_integration_case_types", force: :cascade do |t|
    t.string   "tps_case_type_id", limit: 255
    t.string   "description",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_control_codes", force: :cascade do |t|
    t.integer  "user_id",         limit: 4
    t.integer  "control_code_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_control_codes", ["control_code_id"], name: "user_CCID_control_code_macro", using: :btree
  add_index "user_control_codes", ["user_id"], name: "user_ID_control_code_macro", using: :btree

  create_table "user_histories", force: :cascade do |t|
    t.integer  "user_id",     limit: 4
    t.text     "description", limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "account_id",  limit: 4
  end

  create_table "user_preferences", force: :cascade do |t|
    t.integer  "user_id",                             limit: 4
    t.integer  "default_location_id",                 limit: 4
    t.string   "dashboard",                           limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "auto_assign_case",                                default: false
    t.boolean  "skip_label_autoprint"
    t.boolean  "cassette_autoprint"
    t.integer  "cassette_print_outlet_id",            limit: 4
    t.string   "label_printer_preference",            limit: 255
    t.string   "capture_device",                      limit: 255
    t.string   "default_studies_test_menu",           limit: 255, default: "TC"
    t.boolean  "auto_open_req"
    t.boolean  "image_alert"
    t.boolean  "disable_prelim_signout_warning"
    t.boolean  "auto_print_gross_report"
    t.boolean  "unspecified_case_abnormal",                       default: false
    t.boolean  "display_pap_held_for_reflex_warning"
    t.integer  "default_case_type_id",                limit: 4
    t.boolean  "default_sign_out_first_last_name",                default: false
  end

  add_index "user_preferences", ["default_case_type_id"], name: "index_user_preferences_on_default_case_type_id", using: :btree
  add_index "user_preferences", ["default_location_id"], name: "index_user_preferences_on_default_location_id", using: :btree
  add_index "user_preferences", ["user_id"], name: "index_user_preferences_on_user_id", using: :btree

  create_table "user_slide_counts", force: :cascade do |t|
    t.integer  "user_id",                  limit: 4
    t.float    "count",                    limit: 24
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "date_of_slide_collection"
  end

  create_table "users", force: :cascade do |t|
    t.string   "password",                      limit: 255
    t.string   "password_salt",                 limit: 255
    t.string   "first_name",                    limit: 255
    t.string   "last_name",                     limit: 255
    t.string   "middle_initial",                limit: 1
    t.integer  "account_id",                    limit: 4
    t.string   "email",                         limit: 255
    t.string   "password_reset_key",            limit: 255
    t.datetime "password_reset_key_expiration"
    t.boolean  "active",                                      default: true
    t.string   "credentials",                   limit: 255
    t.string   "title",                         limit: 255
    t.string   "signature_block",               limit: 255
    t.string   "phone_number",                  limit: 10
    t.string   "pin",                           limit: 255
    t.integer  "parent_user",                   limit: 4
    t.boolean  "is_parent_user",                              default: false
    t.boolean  "locked",                                      default: false
    t.boolean  "allow_duplicate_email",                       default: false
    t.text     "custom_sign_out",               limit: 65535
    t.boolean  "uses_parent_email",                           default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "tps_id",                        limit: 255
    t.boolean  "process_reports_immediately"
    t.string   "username",                      limit: 255
    t.integer  "maximum_slides",                limit: 4,     default: 0
    t.integer  "maximum_slides_action",         limit: 4
    t.integer  "rescreen_percent",              limit: 4
    t.integer  "login_account_id",              limit: 4
  end

  add_index "users", ["account_id", "username"], name: "pap_rptCytotechomologistLog", using: :btree
  add_index "users", ["account_id"], name: "index_users_on_account_id", using: :btree
  add_index "users", ["parent_user"], name: "index_users_on_parent_user", using: :btree

  create_table "variable_fields", force: :cascade do |t|
    t.integer  "control_code_type_id", limit: 4
    t.string   "variable",             limit: 255
    t.boolean  "global",                           default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "work_station_types", force: :cascade do |t|
    t.string   "description", limit: 255
    t.datetime "created_at"
  end

  create_table "work_stations", force: :cascade do |t|
    t.integer  "work_station_type_id", limit: 4
    t.string   "serial_number",        limit: 255
    t.string   "manufacturer",         limit: 255
    t.string   "name",                 limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "location_id",          limit: 4
    t.boolean  "active",                           default: true
    t.integer  "sort_order",           limit: 4
  end

end
