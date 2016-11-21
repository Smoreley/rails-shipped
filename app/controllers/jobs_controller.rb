class JobsController < ApplicationController

    before_action :authenticate_user!
    def index
        @message = "index"
        @jobs = Job.all

        if params[:search]
            @jobs = Job.search(params[:search]).order("created_at DESC")
        else
            @jobs = Job.all.order('created_at DESC')
        end
    end

    def new
        @message = "new"
    end

    def create
        @message = "create"
        @new_job = Job.new(job_params)

        if @new_job.save
            redirect_to url_for(:controller => :jobs, :action => :index)
        else
            render 'new'
        end
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
        redirect_to url_for(:controller => :jobs, :action => :index)
    end

    def workers
        @title = "Worker"
        @job  = Job.find(params[:id])
        @boats = @job.boats.paginate(page: params[:page])
        render 'show_follow'
    end

    private

    def job_params
       params.require(:job).permit(:name, :description, :origin, :destination, :latitude, :longitude, :address, :location, :cost, :cc) 
    end
end
