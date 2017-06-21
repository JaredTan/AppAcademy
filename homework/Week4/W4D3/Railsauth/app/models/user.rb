class User < ApplicationRecord

  before_validation :ensure_session_token
  validates :username, presence: true, uniqueness: true
  validates :session_token, presence: true, uniqueness: true

  validates :password_digest, presence: { message: "Your password cannot be blank!" }
  validates :password, length: {minimum: 6, allow_nil: true}


  attr_reader :password

  def self.find_by_credentials
    user = User.find_by(username: username)
    if BCrypt::Password.new(user.password_digest).is_password?(password)
      return user if user
    end
    nil
  end

  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

  def reset_session_token!
    self.session_token = User.generate_session_token
    self.session_token.save
  end

  def ensure_session_token
    self.session_token ||= User.generate_session_token
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end
end
