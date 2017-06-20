class User < ApplicationRecord
  validates :username, presence: true

  has_many :paintings,
    foreign_key: :artist_id,
    class_name: :Artwork

  has_many :artwork_shares,
    foreign_key: :viewer_id

  has_many :shared_artworks,
    through: :paintings,
    source: :artwork_shares
end
