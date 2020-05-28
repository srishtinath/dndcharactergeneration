class CharacterAbilitiesController < ApplicationController
  before_action :find_ca, only: [:edit, :show, :update]
  
  def new
    if flash[:character]
      @character = Character.find(flash[:character]["id"])  
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
    flash[:character] = @character_ability.character
    flash[:job] = @character_ability.character.job
    # if flash[:coming_from_show]
      # redirect_to character_path(@character_ability.character)
    # else
      redirect_to new_character_spell_path
    # end
  end

  def edit
    @character_abilities = CharacterAbility.all.where(character: @character_ability.character)
  end

  def update
  end
  
  def delete_all
    @character = Character.find(flash[:character]["id"])
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
