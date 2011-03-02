class Song < ActiveRecord::Base
  has_attached_file :midi
  has_attached_file :vocal, :url => "/system/midis/:id/:style/:basename.:extension"
  has_attached_file :melody, :url => "/system/midis/:id/:style/:basename.:extension"
  has_attached_file :autotuned, :url => "/system/midis/:id/:style/:basename.:extension"
  has_attached_file :avatar
  validates :name,:coords, :tempo, :genre, :key,:chordProgression, :numPhrase, :presence => true
end




# == Schema Information
#
# Table name: songs
#
#  id                  :integer         not null, primary key
#  name                :string(255)
#  created_at          :datetime
#  updated_at          :datetime
#  midi_file_name      :string(255)
#  midi_content_type   :string(255)
#  midi_file_size      :integer
#  midi_updated_at     :datetime
#  vocal_file_name     :string(255)
#  vocal_content_type  :string(255)
#  vocal_file_size     :integer
#  vocal_updated_at    :datetime
#  style               :string(255)
#  coords              :string(255)
#  tempo               :string(255)
#  genre               :string(255)
#  key                 :string(255)
#  chordProgression    :string(255)
#  numPhrase           :string(255)
#  avatar_file_name    :string(255)
#  avatar_content_type :string(255)
#  avatar_file_size    :integer
#  avatar_updated_at   :datetime
#