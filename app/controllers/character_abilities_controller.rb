class CharacterAbilitiesController < ApplicationController
  before_action :find_ca, only: [:edit, :show, :update]
  
  def new
    @character = Character.find(flash[:character]["id"])
    @characters = Character.all
    @job = Job.find(flash[:job]["id"])
    @abilities = @job.abilities
    @char_ability = CharacterAbility.new
  end

  def create
    @character_ability = CharacterAbility.create(ca_params)
    flash[:character] = @character_ability.character
    flash[:job] = @character_ability.character.job
    redirect_to new_character_spell_path
  end

  def edit
  end

  def update
  
  end

  private

  def find_ca
    @character_ability = CharacterAbility.find(params[:id])
  end

  def ca_params
    params.require(:character_ability).permit(:character_id, :ability_id)
  end
end
