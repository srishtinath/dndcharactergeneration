require 'dnd_api'

class SpellsController < ApplicationController
# before_action :dnd_api
before_action :find_job, only: [:show]

    def index
        @spells = Spell.all
    end

private
    # def dnd_api 
    #     @api = DndApi.new
    #     @api.spells
    # end

    def find_skill
        @spell = Spell.find(params[:id])
    end
    
end

