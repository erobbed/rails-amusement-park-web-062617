class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    return redirect_to login_path  flash[:mesage] = 'login failed!'unless @user.authenticate(params[:user][:password])
    session[:user_id] = @user.id
    redirect_to @user
  end

  def destroy
    session.clear
    redirect_to home_path
  end
end
