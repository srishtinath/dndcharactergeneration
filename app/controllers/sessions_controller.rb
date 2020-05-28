class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:hello, :index, :show]

  def hello
  
  end

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

  def clear_character
    session.delete :character
    @user = User.find(session[:user]["id"])
    redirect_to user_path(@user)
  end
end
