class AssignmentsController < ApplicationController
    
    def create
        boat = Boat.find(params[:assignment][:boat_id])
        job = Job.find(params[:job_id])
        
        job.assign(boat);
        redirect_to job
    end

    def destroy
        boat = Assignment.find(params[:id]).boat
        job = Job.find(params[:job_id])
        
        job.unassign(boat)
        redirect_to job
    end
    

    before_action :configure_permitted_parameters, if: :devise_controller?

    protected
    
    def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:logo])
    end
    
end
