class BoatsController < ApplicationController
    def index
        @message = "index"
        @boats = Boat.all
        
    end

    def new
        @message = "new"
#        @new_boat = Boat.create(params[:boat])
        
    end

    def create
        @message = "create"
        @new_boat = Boat.new(boat_params)
        
        if @new_boat.save
            redirect_to url_for(:controller => :boats, :action => :index)
        else
            render 'new' 
        end
    end

    def show
        @message = "show"
        @boat = Boat.find(params[:id]) 
    end

    def edit
        @message = "edit"
        @boat = Boat.find(params[:id])
    end

    def update
        @message = "update"
        @boat = Boat.find(params[:id])
        
        if @boat.update_attributes(boat_params)
            redirect_to url_for(:controller => :boats, :action => :index)
        else
            render 'edit'
        end
    end

    def destroy
        @message = "destory"
        Boat.delete(params[:id])
        redirect_back(fallback_location: :back)
    end
    
    private
    
    def boat_params
       params.require(:boat).permit(:name, :location, :ccc) 
    end
end
