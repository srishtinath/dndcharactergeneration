class SessionsController < ApplicationController
  skip_before_action :current_user, only: [:new, :create, :index, :show]

  def new
    @user = User.new
    render 'new'
  end

  def create
    @user = User.find_by(name: params["user"]["name"])
    byebug
    if !@user.nil? 
      if @user.authenticate(params["user"]["password"])
        session[:user] = @user
        byebug
        redirect_to '/'  
      else
        flash[:error] = "Password incorrect"
        redirect_to login_path
        byebug
      end
    else
      byebug
      flash[:error] = "There is no user by that name"
      redirect_to login_path
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
