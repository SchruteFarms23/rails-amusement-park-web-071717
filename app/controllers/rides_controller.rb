class RidesController < ApplicationController

  def create
    @ride = Ride.new
    @ride.user_id = session[:user_id]
    @ride.attraction_id = params[:attraction_id]
      flash[:message] = @ride.take_ride
    @ride.save
    redirect_to user_path(session[:user_id])
  end

end
