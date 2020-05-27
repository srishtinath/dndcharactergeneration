class CharacterController < ApplicationController
  before_action :find_char, except: [:index, :new]

  def index
    @characters = Character.all
  end

  def new
    @character = Character.new
    @jobs = Job.all
  end

  def create
    @character = Character.create(char_params)
    #validation
    redirect_to new_abilities_path(@character)
  end
  
  def new_abilities
    @abilities = Ability.where(job: @character.job)
  end
  
  def add_abilities
    #need to add char_abilities to join table with form
    redirect_to new_spells_path(@character)
  end

  def new_spells
    @spells = JobSpell.where(job: @character.job)
  end
  
  def add_spells
    #need to add char_spells to join table with form
    redirect_to character_path(@character)
  end

  def edit
    @jobs = Job.all
  end
  
  def update
    @character.update(char_params)
    redirect_to character_path(@character)
  end
  
  def edit_abilities
    @abilities = CharacterAbility.where(character: @character)
  end

  def update_abilities
    #delete existing associations and add new ones
    redirect_to character_path(@character)
  end

  def edit_spells
    @spells = CharacterSpell.where(character: @character)
  end
  
  def update_spells
    #delete existing associations and add new ones
    redirect_to character_path(@character)
  end

  private

  def find_char
    @character = Character.find(params[:id])
  end

  def char_params
    params.require(:character).permit(:user, :job, :name, :level, :strength, :dexterity, :constitution, :intelligence, :wisdom, :charisma, :hp, :proficiency_bonus, :passive_wisdom, :character_abilities, :character_spells)
  end
end
