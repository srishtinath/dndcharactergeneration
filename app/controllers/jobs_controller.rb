require 'dnd_api'

class JobsController < ApplicationController
# before_action :dnd_api

    def index
        # byebug
        @jobs = Job.all
    end

private
    # def dnd_api 
    #     @api = DndApi.new
    # end

end
