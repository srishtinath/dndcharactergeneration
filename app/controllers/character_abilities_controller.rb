class CharacterAbilitiesController < ApplicationController
  before_action :find_ca, only: [:show, :edit, :update]

  def index
    if session[:character]
      @character = Character.find(session[:character]["id"])
      @abilities = CharacterAbility.where(character: @character)
    else
      @abilities = CharacterAbility.all
    end
  end

  def show
  end

  def new
    if session[:character]
      @character = Character.find(session[:character]["id"])  
    else
      @character = Character.last
    end
    @job = Job.find(@character.job.id)
    @abilities = @job.abilities
    @characters = Character.all
    @char_ability = CharacterAbility.new
  end

  def create
    @character_ability = CharacterAbility.create(ca_params)
    session[:character] = @character_ability.character
    session[:job] = @character_ability.character.job
    # if flash[:coming_from_show]
      # redirect_to character_path(@character_ability.character)
    # else
      redirect_to new_character_spell_path
    # end
  end

  def edit
    @characters = Character.all
    @job = @character_ability.character.job
    @abilities = @job.abilities
  end

  def update
    @character_ability.update(ca_params)
    redirect_to character_path(@character_ability.character)
  end
  
  def delete_all
    @character = Character.find(session[:character]["id"])
    CharacterAbility.where(character: @character).delete_all
    redirect_to character_path(@character)
  end

  private

  def find_ca
    @character_ability = CharacterAbility.find(params[:id])
  end

  def ca_params
    params.require(:character_ability).permit(:character_id, :ability_id)
  end
end
