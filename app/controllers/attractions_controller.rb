class AttractionsController < ApplicationController

  def new
    @attraction = Attraction.new
  end

  def create

    @attraction = Attraction.create(attraction_params)
    redirect_to attraction_path(@attraction)
  end

  def index
    @attractions = Attraction.all
    @user = User.find(session[:user_id])
  end

  def show
    @attraction = Attraction.find(params[:id])
    @user = User.find(session[:user_id])

  end

  def edit
    @attraction = Attraction.find(params[:id])
  end

  private
  def attraction_params
    params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
  end
end
