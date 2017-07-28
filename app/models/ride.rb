class Ride < ActiveRecord::Base
  # write associations here
  belongs_to :user
  belongs_to :attraction

  def take_ride
    if self.height? && self.tickets?
      self.user.tickets -= self.attraction.tickets
      self.user.happiness += self.attraction.happiness_rating
      self.user.nausea += self.attraction.nausea_rating
      self.user.save
      "Thanks for riding the #{self.attraction.name}!"
    else
      if self.height? == false && self.tickets? == false
        "Sorry. You do not have enough tickets to ride the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
      elsif self.height? == false
        "Sorry. You are not tall enough to ride the #{self.attraction.name}."
      elsif self.tickets? == false
        "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
      end
    end
  end

  def tickets?
    self.user.tickets >= self.attraction.tickets ? true : false
  end

  def height?
    self.user.height >= self.attraction.min_height ? true : false
  end
end
