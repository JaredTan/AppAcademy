class PostSub < ApplicationRecord
  validates :post, :sub, presence: true
  # validates :sub_id, uniqueness: { scope: :post_id }

  belongs_to   :post,
  primary_key: :id,
  foreign_key: :post_id,
  class_name:  :Post,
  inverse_of:  :post_subs

  belongs_to :sub,
  primary_key: :id,
  foreign_key: :sub_id,
  class_name: :Sub,
  inverse_of: :post_subs

end
