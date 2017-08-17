class UsersController < ApplicationController

  def home
  end

  def signin
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    session[:user_id] = @user.id
    redirect_to user_path(@user)
    # binding.pry
  end

  def show
    # binding.pry
    if session[:user_id]
      @user = User.find(params[:id])
    else
      redirect_to '/'
    end

  end

  private
  def user_params
    params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height, :admin)
  end

end
