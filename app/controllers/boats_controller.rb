class BoatsController < ApplicationController
    def index
        @message = "index"
        @boats = Boat.all
        
    end

    def new
        @message = "new"
        @new_boat = Boat.create(params[:user])
        
    end

    def create
        @message = "create"
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
    end

    def destroy
        @message = "destory"
    end
end
