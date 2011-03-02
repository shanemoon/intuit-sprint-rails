class AddThingsToSongs < ActiveRecord::Migration
  def self.up
    add_column :songs, :genre, :string
    add_column :songs, :key, :string
    add_column :songs, :chordProgression, :string
    add_column :songs, :numPhrase, :string
  end

  def self.down
    remove_column :songs, :numPhrase
    remove_column :songs, :chordProgression
    remove_column :songs, :key
    remove_column :songs, :genre
  end
end
