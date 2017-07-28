class UsersController < ApplicationController

  def new
  end

  def create
    @user = User.create(user_params)
    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end

  def show
    current_user
    return redirect_to home_path flash[:message] ='login failed!' unless session.include?(:user_id)
  end

  def edit
    current_user
  end

  private
  def user_params
    params.require(:user).permit(:name, :nausea, :happiness, :tickets, :height, :password, :admin)
  end

end
