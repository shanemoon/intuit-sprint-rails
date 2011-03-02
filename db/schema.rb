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

ActiveRecord::Schema.define(:version => 20110224042408) do

  create_table "data_files", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "songs", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "midi_file_name"
    t.string   "midi_content_type"
    t.integer  "midi_file_size"
    t.datetime "midi_updated_at"
    t.string   "vocal_file_name"
    t.string   "vocal_content_type"
    t.integer  "vocal_file_size"
    t.datetime "vocal_updated_at"
    t.string   "style"
    t.string   "coords"
    t.string   "tempo"
    t.string   "genre"
    t.string   "key"
    t.string   "chordProgression"
    t.string   "numPhrase"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "melody_file_name"
    t.string   "melody_content_type"
    t.integer  "melody_file_size"
    t.datetime "melody_updated_at"
    t.string   "autotuned_file_name"
    t.string   "autotuned_content_type"
    t.integer  "autotuned_file_size"
    t.datetime "autotuned_updated_at"
  end

end
