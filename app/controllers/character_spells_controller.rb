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
    if session[:character]
      @character = Character.find(session[:character]["id"])
    else
      @character = Character.last
    end
    @job = Job.find(@character.job.id)
    @spells = @job.spells
    @characters = Character.all
    @char_spell = CharacterSpell.new
  end

  def create
    @character_spell = CharacterSpell.create(cs_params)
    redirect_to character_path(@character_spell.character)
  end

  def edit
    @characters = Character.all
    @job = @character_spell.character.job
    @spells = @job.spells
  end

  def update
    @character_spell.update(cs_params)
    redirect_to character_path(@character_spell.character)
  end

  
  def delete_all
    @character = Character.find(flash[:character]["id"])
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
