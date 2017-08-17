
class SessionsController < ApplicationController
  def new
    render :signin
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    if @user && @user.password == params[:user][:password]
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to signin_path
    end
  end

  def destroy
    session.clear
    redirect_to '/'
  end

end
