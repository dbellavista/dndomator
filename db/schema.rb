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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130320144044) do

  create_table "encounters", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "experience"
    t.boolean  "completed"
    t.text     "setup"
    t.text     "tactics"
    t.text     "features"
    t.text     "conclusion"
    t.boolean  "bypassed"
  end

  create_table "encounters_monsters", :force => true do |t|
    t.integer "encounter_id"
    t.integer "monster_id"
  end

  add_index "encounters_monsters", ["encounter_id", "monster_id"], :name => "index_encounters_monsters_on_encounter_id_and_monster_id"

  create_table "heros", :force => true do |t|
    t.string   "name"
    t.string   "player"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.text     "background"
    t.integer  "experience"
  end

  create_table "items", :force => true do |t|
    t.string   "name"
    t.integer  "level"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "value"
  end

  create_table "monsters", :force => true do |t|
    t.string   "name"
    t.integer  "level"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "tier"
    t.string   "kind"
  end

  create_table "quests", :force => true do |t|
    t.string   "name"
    t.string   "kind"
    t.text     "description"
    t.integer  "level"
    t.boolean  "completed"
    t.boolean  "succeded"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "skill_challenges", :force => true do |t|
    t.string   "name"
    t.text     "context"
    t.integer  "complexity"
    t.integer  "level"
    t.text     "primary_skill"
    t.text     "secondary_skill"
    t.text     "success"
    t.text     "failure"
    t.boolean  "completed"
    t.boolean  "succeded"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "progress_success"
    t.integer  "progress_failure"
  end

  create_table "treasures", :force => true do |t|
    t.text     "description"
    t.integer  "level"
    t.integer  "quantity"
    t.integer  "quantity_assigned"
    t.integer  "item_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.integer  "packet"
    t.integer  "hero_id"
  end

  add_index "treasures", ["hero_id"], :name => "index_treasures_on_hero_id"
  add_index "treasures", ["item_id"], :name => "index_treasures_on_item_id"

end
