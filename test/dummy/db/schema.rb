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

ActiveRecord::Schema.define(version: 20160727205008) do

  create_table "dynamic_forms_answers", force: :cascade do |t|
    t.integer  "response_id"
    t.integer  "item_id"
    t.string   "value_type"
    t.integer  "value_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["item_id"], name: "df_answer_item"
    t.index ["response_id"], name: "df_answer_resp"
    t.index ["value_type", "value_id"], name: "df_answer_value"
  end

  create_table "dynamic_forms_form_items", force: :cascade do |t|
    t.integer  "form_id"
    t.string   "item_type"
    t.integer  "item_id"
    t.string   "attribute_name"
    t.integer  "position"
    t.boolean  "required"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["attribute_name"], name: "df_form_items_attr_name"
    t.index ["form_id"], name: "df_form_items_form"
    t.index ["item_type", "item_id"], name: "df_form_items_item"
    t.index ["position"], name: "df_form_items_position"
  end

  create_table "dynamic_forms_form_responses", force: :cascade do |t|
    t.integer  "form_id"
    t.string   "respondent_type"
    t.integer  "respondent_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["form_id"], name: "df_form_resp_form"
    t.index ["respondent_type", "respondent_id"], name: "df_form_resp_resp"
  end

  create_table "dynamic_forms_forms", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "dynamic_forms_multiple_choice_options", force: :cascade do |t|
    t.integer  "question_id"
    t.integer  "position"
    t.string   "label"
    t.integer  "value"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["position"], name: "df_multi_option_pos"
    t.index ["question_id"], name: "df_multi_option_q"
  end

  create_table "dynamic_forms_multiple_choice_questions", force: :cascade do |t|
    t.integer  "text_block_id"
    t.boolean  "multiple"
    t.string   "appearance"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["text_block_id"], name: "df_multi_choice_text"
  end

  create_table "dynamic_forms_multiple_choice_values", force: :cascade do |t|
    t.integer  "option_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["option_id"], name: "df_multi_choice_val_option"
  end

  create_table "dynamic_forms_text_blocks", force: :cascade do |t|
    t.string   "title"
    t.string   "appearance"
    t.text     "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dynamic_forms_text_questions", force: :cascade do |t|
    t.integer  "text_block_id"
    t.integer  "rows"
    t.integer  "max_chars"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["text_block_id"], name: "df_txt_q_txt_blk"
  end

  create_table "dynamic_forms_text_values", force: :cascade do |t|
    t.text     "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
