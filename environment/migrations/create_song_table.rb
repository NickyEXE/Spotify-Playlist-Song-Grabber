class CreateSongTable < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
    t.string :name
    t.string :artist
    t.string :spotify_id
    t.string :album
    t.string :lyrics
    t.timestamps
    end
  end
end