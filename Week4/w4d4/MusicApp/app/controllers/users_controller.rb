class UsersController < ApplicationController

before_action :require_logged_out, only: [:new, :create]
before_action :require_logged_in, only: [:destroy]
  #
  # def show
  #   @user = User.find_by_email(email)
  #   if @user
  #     redirect_to user_url(@user)
  #   else
  #     flash[:errors] = @user.errors.full_messages
  #     redirect_to bands_url
  #   end
  # end

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login!(@user)
      redirect_to bands_url
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end


  def destroy
    @user = current_user
    if @user.destroy
      flash[:notice] = "You successfully deleted yourself!!"
      redirect_to bands_url
    else
      redirect_to user_url(@user)
    end
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end

end
