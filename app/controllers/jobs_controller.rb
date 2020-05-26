require 'dnd_api'

class JobsController < ApplicationController
before_action :dnd_api

    def index
        @jobs = @api.classes
    end

private
    def dnd_api 
        @api = DndApi.new
    end

end
