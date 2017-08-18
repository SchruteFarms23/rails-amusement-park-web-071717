class Ride < ActiveRecord::Base
 belongs_to :user
 belongs_to :attraction

   def take_ride
    #  @valid_height = false
    #  @valid_tickets = false
     @user = User.find(self.user_id)
     @attraction = Attraction.find(self.attraction_id)
    #  ticket_check(user, attraction)
    #  height_check(user, attraction)

    #  if @valid_height == false && @valid_tickets == false
    #    return "Sorry. #{ticket_check(user, attraction)} #{height_check(user, attraction)}"
    #  elsif @valid_height == true && @valid_tickets == false
    #    return "Sorry. #{ticket_check(user, attraction)}"
    #  elsif @valid_height == false && @valid_tickets == true
    #    return "Sorry. #{height_check(user, attraction)}"
    #  else
    #    valid_ride(user,attraction)
    #    "Thanks for riding the Ferris Wheel!"
    #  end
    if @user.tickets < @attraction.tickets && @user.height < @attraction.min_height
      "Sorry. You do not have enough tickets to ride the #{@attraction.name}. You are not tall enough to ride the #{@attraction.name}."
    elsif @user.tickets < @attraction.tickets
      "Sorry. You do not have enough tickets to ride the #{@attraction.name}."
    elsif @user.height < @attraction.min_height
      "Sorry. You are not tall enough to ride the #{@attraction.name}."
    else
      @user.tickets -= @attraction.tickets
      @user.nausea += @attraction.nausea_rating
      @user.happiness += @attraction.happiness_rating
      @user.save
      "Thanks for riding the #{@attraction.name}!"
    end

   end
   #
  #  def ticket_check(user, attraction)
  #    if user.tickets < attraction.tickets
  #      "You do not have enough tickets to ride the #{attraction.name}."
  #    else
  #      @valid_tickets = true
  #    end
  #  end
   #
  #  def height_check(user, attraction)
  #    if user.height < attraction.min_height
  #       "You are not tall enough to ride the #{attraction.name}."
  #    else
  #      @valid_height = true
  #    end
  #  end
   #
  #  def valid_ride(user, attraction)
  #    user.tickets = user.tickets - attraction.tickets
  #    user.nausea = user.nausea + attraction.nausea_rating
  #    user.happiness = user.happiness + attraction.happiness_rating
  #    user.save
  #  end

end
