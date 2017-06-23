class Album < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :band_id, presence: true

  belongs_to :band

  has_many :tracks
end
