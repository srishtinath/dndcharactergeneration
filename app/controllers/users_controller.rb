class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update, :destroy]
  skip_before_action :current_user, only: [:hello, :new, :create]

  def hello
    @greetings_array = ["Welcome", "Hello", "Greetings", "Bonjour", "Salut", "Hola", "Guten Tag", "Privyet", "Ni Hao", "Namaste", "Shalom", "Marhaba"]
    @greetings = @greetings_array.sample
  end

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
    if @user.valid?
      session[:user] = @user
      redirect_to user_path(@user)
    else
      flash[:error] = @user.errors.full_messages
      redirect_to new_user_path
    end
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
