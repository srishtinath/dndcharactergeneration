class CharacterSpellsController < ApplicationController
  before_action :find_cs, only: [:edit, :show, :update]
  

  def index
    if session[:character]
      @character = Character.find(session[:character]["id"])
      @spells = CharacterSpell.where(character: @character)
    else
      @spells = Spell.all
    end
  end
  
  def show
  end

  def new
    @character = Character.find(session[:character]["id"])
    # if session[:character]
    #   @character = Character.find(session[:character]["id"])
    # else
    #   @character = Character.last
    # end
    @job = Job.find(@character.job.id)
    @spells = @job.spells
    @characters = Character.all
    @char_spell = CharacterSpell.new
  end

  def create
    @character = Character.find(session[:character]["id"])
    @character_spell = CharacterSpell.create(character: @character)
    @character_spell.update(cs_params)
    redirect_to character_path(@character)
  end
  
  def edit
    @character = Character.find(session[:character]["id"])
    @character_spells = @character.spells
    @characters = Character.all
    @job = @character_spell.character.job
    @spells = @job.spells
  end

  def update
    @character_spell.update(cs_params)
    redirect_to character_path(@character_spell.character)
  end

  
  def delete_all
    @character = Character.find(session[:character]["id"])
    CharacterSpell.where(character: @character).delete_all
    redirect_to character_path(@character)
  end

  private

  def find_cs
    @character_spell = CharacterSpell.find(params[:id])
  end

  def cs_params
    params.require(:character_spell).permit(:character_id, :spell_id)
  end
end
