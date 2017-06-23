class Track < ApplicationRecord
  validates :name, presence: true
  validates :album_id, presence: true

  belongs_to :album

  has_one :band
  through :album

end
