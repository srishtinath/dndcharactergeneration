class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update, :destroy]
  skip_before_action :require_login, only: [:new, :create]

  def index
    @users = User.all
  end

  def show
    session[:user] = @user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    session[:user] = @user
    redirect_to user_path(@user)
  end

  def edit
  end

  def update
    @user.update(user_params)
  end

  def destroy
      @user.destroy
      redirect_to users_path
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
