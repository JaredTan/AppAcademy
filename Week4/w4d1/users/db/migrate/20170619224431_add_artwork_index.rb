class AddArtworkIndex < ActiveRecord::Migration[5.0]
  def change
    add_index :artwork_shares, :artwork_id
    add_index :artwork_shares, :viewer_id
    add_index :artworks, :artist_id
  end

end
