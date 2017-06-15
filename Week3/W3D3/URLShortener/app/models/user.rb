
class User < ActiveRecord::Base
  validates :e_mail, presence: true, uniqueness: true

  has_many :submitted_urls,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: "ShortenedUrl"

  has_many :user_visits,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: "Visit"

  has_many :visited_urls,
    through: :user_visits,
    source: :shortened_url

end
