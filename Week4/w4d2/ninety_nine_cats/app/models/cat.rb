class Cat < ApplicationRecord

  COLORS = %w(black brown white gray pink purple)

  validates :birth_date, presence: true
  validates :color, presence: true, inclusion: { in: COLORS,
    message: "%{color} is not a valid size" }
  validates :name, presence: true
  validates :sex, presence: true, inclusion: { in: ['M', 'F'], message:
  "%{sex} is not a valid sex" }
  # validates :description

  has_many :rental_requests, dependent: :destroy,
  primary_key: :id,
  foreign_key: :cat_id,
  class_name: "CatRentalRequest"

end
