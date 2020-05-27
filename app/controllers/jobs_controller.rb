require 'dnd_api'

class JobsController < ApplicationController
<<<<<<< HEAD
# before_action :dnd_api
=======
before_action :dnd_api, only: [:index]
>>>>>>> bfcb96954909dd024e68401854cb969c72fe2bf3
before_action :find_job, only: [:show]

    def index
        @jobs = Job.all
    end

    def show
        @job_details = @job.job_details
    end

private
<<<<<<< HEAD
    # def dnd_api 
    #     @api = DndApi.new
    #     @api.classes
    # end
=======
    def dnd_api 
        @jobs = DndApi.new
        @jobs.classes
    end
>>>>>>> bfcb96954909dd024e68401854cb969c72fe2bf3

    def find_job
        @job = Job.find(params[:id])
    end
end
