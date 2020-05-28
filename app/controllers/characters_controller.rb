class CharactersController < ApplicationController
  before_action :find_char, except: [:index, :new, :create, :stats]

  def index
    @characters = Character.all
  end

  def new
    @character = Character.new
    @jobs = Job.all
  end

  def create
    @user = User.find(User.last.id)
    @character = Character.create(user: @user)
    @character.update(char_params)
    session[:character] = @character
    byebug
    redirect_to stats_path(@character)
  end
  
  def stats
    id = session[:character]["id"]
    @character = Character.find(id)
    byebug
  end

  def edit
    byebug
    @jobs = Job.all
  end
  
  def update
    byebug
    @character.update(char_params)
    if @character.level != nil
      session[:character] = @character
      session[:job] = @character.job
      @character.define_proficiency_bonus
      redirect_to new_character_ability_path
    else
      @character.define_proficiency_bonus
      redirect_to character_path(@character)
    end
  end

  def show
  end
  
  def destroy
    @character.destroy
    redirect_to characters_path
  end

  private

  def find_char
    @character = Character.find(params[:id])
  end

  def char_params
    params.require(:character).permit(:user, :job_id, :name, :level, :strength, :dexterity, :constitution, :intelligence, :wisdom, :charisma, :hp, :proficiency_bonus, :passive_wisdom, :character_abilities, :character_spells)
  end
end
