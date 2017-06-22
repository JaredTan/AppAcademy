class CatRentalRequest < ApplicationRecord
  validates :cat_id, :start_date, :end_date, :status, presence: true

  belongs_to :cat,
    primary_key: :id,
    foreign_key: :cat_id,
    class_name: :Cat,
    dependent: :destroy

  def overlapping_requests
    CatRentalRequest.cawhere("self.start_date < b ")
  end


  #belongs_to cats association; has_many cat_rental_requests association
  #destroy dependents
end
