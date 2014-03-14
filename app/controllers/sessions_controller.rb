class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.where(login: params[:login]).first
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_url
    else
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
end
