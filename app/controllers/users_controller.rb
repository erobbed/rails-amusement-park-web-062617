class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end

  def show
    @user = User.find_by(id: session[:user_id])
    return redirect_to home_path flash[:message] ='login failed!' unless session.include?(:user_id)
  end

  def edit
    @user = User.find_by(id: session[:user_id])
  end

  private
  def user_params
    params.require(:user).permit(:name, :nausea, :happiness, :tickets, :height, :password, :admin)
  end

end
