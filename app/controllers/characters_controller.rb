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
    @character = Character.create(char_params)
    flash[:character] = @character
    redirect_to stats_path(@character)
  end
  
  def stats
    id = flash[:character]["id"].to_i
    @character = Character.find(id)
  end

  def edit
    @jobs = Job.all
  end
  
  def update
    @character.update(char_params)
    if @character.level != nil
      flash[:character] = @character
      flash[:job] = @character.job
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
