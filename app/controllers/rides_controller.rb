class RidesController < ApplicationController

  def new
    @ride = Ride.new(user_id: session[:user_id], attraction_id: params[:ride][:attraction_id])
    # if @ride.take_ride == "Thanks for riding the #{@ride.attraction.name}!"
    flash[:message] = @ride.take_ride
    redirect_to user_path(session[:user_id])
  end
end
