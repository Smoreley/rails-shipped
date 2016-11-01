class JobsController < ApplicationController
    def index
        @message = "index"
        @jobs = Job.all
        
    end

    def new
        @message = "new"
        @new_job = Job.create(params[:user])
        
    end

    def create
        @message = "create"
    end

    def show
        @message = "show"
        @job = Job.find(params[:id]) 
    end

    def edit
        @message = "edit"
        @job = Job.find(params[:id]) 
    end

    def update
        @message = "update"
    end

    def destroy
        @message = "destory"
    end
end
