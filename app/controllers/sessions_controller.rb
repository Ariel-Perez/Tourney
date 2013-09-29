class SessionsController < ApplicationController

  def new

  end

  def create  	
  	if p = Player.find_by(:nick => params[:session][:nick]).try(:authenticate, params[:session][:password])
      session[:user_id] = p.id
      flash.notice = "Signed in successflly"
      redirect_to root_path
    else
      flash.now.alert = "Wrong email or password."
      render :new
    end
  end

  def destroy
    reset_session
    flash.notice = "Signed out successfully!"
    redirect_to root_path
  end
end
