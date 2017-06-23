class Cat < ApplicationRecord
  COLORS = ["Black", "White", "Grey", "Orange", "Cream", "Brown"]

  validates :birth_date, :name, :description, presence: true
  validates :color, inclusion: { in: COLORS, message: "%{value} is not a valid color" }
  validates :sex, inclusion: { in: %w(M F), message: "%{value} is not a valid sex" }

  has_many :cat_rental_requests,
    primary_key: :id,
    foreign_key: :cat_id,
    class_name: :CatRentalRequest

  def self.colors
    COLORS
  end

  def age
    age = Date.today.year - birthday.year
    age -= 1 if Date.today < birthday + age.years
  end
end

#
