class ShortenedUrl < ActiveRecord::Base
  validates :long_url, presence: true
  validates :user_id, presence: true

  belongs_to :submitter,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: "User"

  has_many :url_visits,
    primary_key: :id,
    foreign_key: :url_id,
    class_name: "Visit"

  has_many :visitors,
    through: :url_visits,
    source: :user



  def self.create!(user_object, long_url)
    short_url = SecureRandom::urlsafe_base64

    until !ShortenedUrl.exists?(long_url: short_url)
      short_url = SecureRandom::urlsafe_base64
    end

    ShortenedUrl.create(
      short_url: short_url,
      long_url: long_url,
      user_id: user_object.id
    )
  end

  def num_clicks
    url_visits.count
  end

  def num_uniques
    url_visits.uniq.count
  end

  def num_recent_uniques
    url_visits.select {|visit| Time.now - visit.created_at  < 10000 }
  end

end
