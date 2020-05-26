require 'dnd_api'

class JobsController < ApplicationController
before_action :dnd_api, only: [:index]
before_action :find_job, only: [:show]

    def index
        @jobs = Job.all
    end

    def show
        @job_details = @job.job_details
    end

private
    def dnd_api 
        @api = DndApi.new
        @api.classes
    end

    def find_job
        @job = Job.find(params[:id])
    end
end
