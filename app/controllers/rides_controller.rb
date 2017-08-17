class RidesController < ApplicationController

  def create
    @ride = Ride.new
    @ride.user_id = session[:user_id]
    @ride.attraction_id = params[:attraction_id]
    if @ride.valid?
      @ride.save
    # flash[:success] = "Thanks for riding the #{Attraction.find(@ride.attraction_id).name}!"
    #
    end
    redirect_to user_path(session[:user_id])
  end

end
