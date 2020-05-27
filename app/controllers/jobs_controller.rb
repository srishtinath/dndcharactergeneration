require 'dnd_api'

class JobsController < ApplicationController
# before_action :dnd_api
before_action :find_job, only: [:show]

    def index
        @jobs = Job.all
    end

    def show
        @bard_job_details = @job.class_details("bard")
    end

private
    # def dnd_api 
    #     @api = DndApi.new
    #     @api.classes
    # end

    def find_job
        @job = Job.find(params[:id])
    end
end
