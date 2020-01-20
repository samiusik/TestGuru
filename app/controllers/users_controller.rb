class UsersController < ApplicationController

  skip_before_action :authenticate!, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.email.downcase!

    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
      flash.now[:notice] = "Hello #{@user.email}, you are registed "
    else
      flash.now.alert = "Oops, make sure you entering correct email and password confirmation"
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:title, :email, :password, :password_confirmation)
  end

end
