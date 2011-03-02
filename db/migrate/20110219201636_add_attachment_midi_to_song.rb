class AddAttachmentMidiToSong < ActiveRecord::Migration
  def self.up

    add_column :songs, :midi_file_name, :string
    add_column :songs, :midi_content_type, :string
    add_column :songs, :midi_file_size, :integer
    add_column :songs, :midi_updated_at, :datetime

  end

  def self.down

    remove_column :songs, :midi_file_name
    remove_column :songs, :midi_content_type
    remove_column :songs, :midi_file_size
    remove_column :songs, :midi_updated_at

  end
end
