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
        @job = Job.find(params[:id])
        
        if @job.update_attributes(job_params)
            redirect_to url_for(:controller => :jobs, :action => :index)
        else
            render 'edit' 
        end
    end

    def destroy
        @message = "destory"
        Job.delete(params[:id])
        redirect_back(fallback_location: :back)
    end
    
    private
    
    def job_params
       params.require(:job).permit(:name, :description, :origin, :destination, :cost, :cc) 
    end
end
