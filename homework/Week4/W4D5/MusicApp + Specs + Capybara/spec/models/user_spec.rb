require 'rails_helper'


RSpec.describe User, type: :model do

  subject(:user) do
    FactoryGirl.build(:user, email: 'coolkid11@gmail.com', password: 'imaboss')
  end

  it { should validate_presence_of(:email) }

  it { should validate_presence_of(:password_digest) }

  it { should validate_length_of(:password_digest).is_at_least(6) }

  it 'creates a password digest if given a password' do
    expect(user.password_digest).to_not eq(password)
  end

  it 'creates a session token' do
    expect(user.session_token).to_not be_nil
  end

  describe '#reset_session_token!' do
    it 'sets a new session token on the user' do
      old_token = user.session_token
      user.reset_session_token!

      expect(user.session_token).to_not eq(old_token)
    end
  end

  describe '#is_password' do
    it 'checks a valid password' do
      expect(user.is_password?('imaboss')).to be true
    end

    it 'returns false for a wrong password' do
      expect(user.is_password('notaboss')).to be false
    end
  end

  describe '::find_by_credentials' do
    it 'finds the correct user' do
      expect(User.find_by_credentials('coolkid11@gmail.com', 'imaboss')).to eq(user)
    end
  end

end
