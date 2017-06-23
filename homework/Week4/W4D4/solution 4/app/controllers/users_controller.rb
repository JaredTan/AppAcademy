class UsersController < ApplicationController
  before_action :require_no_user!

  def create
    @user = User.new(user_params)
    if @user.save
      msg = UserMailer.welcome_email(@user)
      msg.deliver_now
      login_user!(@user)
      flash[:notice] = "hi georgio"
      redirect_to cats_url
    else
      flash[:errors] = @user.errors.full_messages
      flash[:errors] += ['hi janet']
      redirect_to cats_url
    end
  end

  def new
    @user = User.new
    render :new
  end

  private
  def user_params
    params.require(:user).permit(:password, :username)
  end
end
