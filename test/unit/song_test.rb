require 'test_helper'

class SongTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
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

