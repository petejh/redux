class SessionsController < ApplicationController
  def new
  end
  def create
    @user = User.find_by login: params[:login]
    session[:user_id] = @user.id
    redirect_to root_url
  end
end
