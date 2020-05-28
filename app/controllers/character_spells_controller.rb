class CharacterSpellsController < ApplicationController
  before_action :find_cs, only: [:edit, :show, :update]
  
  def new
    @character = Character.find(flash[:character]["id"])
    @characters = Character.all
    @job = Job.find(flash[:job]["id"])
    @spells = @job.spells
    @char_spell = CharacterSpell.new
  end

  def create
    @character_spell = CharacterSpell.create(cs_params)
    redirect_to character_path(@character_spell.character)
  end

  def edit
  end

  def update
  end

  private

  def find_cs
    @character_spell = CharacterSpell.find(params[:id])
  end

  def cs_params
    params.require(:character_spell).permit(:character_id, :spell_id)
  end
end
