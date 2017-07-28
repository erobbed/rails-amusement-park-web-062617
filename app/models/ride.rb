class Ride < ActiveRecord::Base
  # write associations here
  belongs_to :user
  belongs_to :attraction

  def take_ride
    if self.user.tickets >= self.attraction.tickets && self.user.height >= self.attraction.min_height
    else
      flash[:message] = "Sorry. You do not have enough tickets to ride the Roller Coaster."
      redirect_to attractions_show(self.attraction)
    end
  end
end
