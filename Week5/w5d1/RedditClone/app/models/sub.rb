class Sub < ApplicationRecord

  validates :title, :description, :moderator, presence: true

  belongs_to :moderator,
    foreign_key: :moderator_id,
    class_name: :User,
    inverse_of: :subs

  has_many :post_subs, dependent: :destroy, inverse_of: :sub

  has_many :posts, through: :post_subs, source: :post



end
