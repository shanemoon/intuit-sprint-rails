class AddStuffToSongs < ActiveRecord::Migration
  def self.up
    add_column :songs, :style, :string
    add_column :songs, :coords, :string
    add_column :songs, :tempo, :string
  end

  def self.down
    remove_column :songs, :tempo
    remove_column :songs, :coords
    remove_column :songs, :style
  end
end
