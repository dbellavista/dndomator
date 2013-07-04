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

ActiveRecord::Schema.define(:version => 20130704063717) do

  create_table "achievement_instances", :force => true do |t|
    t.integer  "hero_id"
    t.integer  "achievement_id"
    t.text     "description"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "achievement_instances", ["achievement_id"], :name => "index_achievement_instances_on_achievement_id"
  add_index "achievement_instances", ["hero_id"], :name => "index_achievement_instances_on_hero_id"

  create_table "achievements", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "hero_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "achievements", ["hero_id"], :name => "index_achievements_on_hero_id"

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
    t.string   "hero_class"
    t.string   "race"
    t.integer  "perception"
    t.integer  "insight"
    t.integer  "fortitude"
    t.integer  "reflex"
    t.integer  "will"
    t.boolean  "active"
  end

  create_table "items", :force => true do |t|
    t.string   "name"
    t.integer  "level"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "value"
    t.integer  "hero_id"
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

  create_table "treasure_components", :force => true do |t|
    t.integer  "treasure_id"
    t.integer  "item_id"
    t.integer  "quantity"
    t.integer  "quantity_assigned"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.integer  "hero_id"
    t.text     "description"
  end

  add_index "treasure_components", ["item_id"], :name => "index_treasure_components_on_item_id"
  add_index "treasure_components", ["treasure_id"], :name => "index_treasure_components_on_treasure_id"

  create_table "treasures", :force => true do |t|
    t.text     "description"
    t.integer  "level"
    t.integer  "item_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "hero_id"
  end

  add_index "treasures", ["hero_id"], :name => "index_treasures_on_hero_id"
  add_index "treasures", ["item_id"], :name => "index_treasures_on_item_id"

end
