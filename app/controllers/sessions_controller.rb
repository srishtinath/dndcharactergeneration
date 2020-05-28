class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    session[:user] = params[:user]
      if session[:user].nil? || session[:user].empty?
        redirect_to '/login'
      else
        session[:user] = params[:user]
        redirect_to '/'
      end
  end

  def destroy
    session.delete :user
    redirect_to '/'
  end
end
