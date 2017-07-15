class UsersController < ApplicationController

  before_action: require_logged_out

  def new
    @user = User.new
  end

  def create
    @user = User.find_by_credentials(
      params[user][username],
      params[user][password]
    )
    if @user
      login!(@user)
      redirect_to links_url
    else
      flash.now[:errors] = errors.full_messages
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
