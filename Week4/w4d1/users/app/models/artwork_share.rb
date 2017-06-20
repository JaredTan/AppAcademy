class ArtworkShare < ApplicationRecord
  validates :artwork_id, presence: true
  validates :viewer_id, presence: true, uniqueness: true

  belongs_to :artwork

  belongs_to :viewer,
    class_name: :User
end
