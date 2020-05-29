require 'dnd_api'
class AbilitiesController < ApplicationController
  
  # before_action :dnd_api, only: [:index]
  
  def show
  end

  def index
    @abilities = Ability.all
  end

  private

  # def dnd_api 
  #   @get_abs = DndApi.new
  #   @get_abs.abilities
  # end
end
