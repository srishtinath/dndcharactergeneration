class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:hello, :index, :show]

  def hello
  
  end

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(name: params[:name])
    return head(:forbidden) unless @user.authenticate(params[:password])
    session[:user] = @user
    redirect_to '/'  
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
