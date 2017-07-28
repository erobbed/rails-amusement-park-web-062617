class RidesController < ApplicationController

  def new
    @ride = Ride.new(user_id: session[:user_id], attraction_id: params[:ride][:attraction_id])
    @ride.take_ride
    redirect_to @user
  end
end
