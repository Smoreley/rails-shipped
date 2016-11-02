class PlacesController < ApplicationController
  def index
    @message = "testing"
    @places  = Place.all
    #@place.all
      if params[:search].present?
        @places = Place.near(params[:search], 50, :order => :distance)
      else
        @places = Place.all
      end
  end

  def new
      @message = "new"
      @places = Place.new

  end

  def create
      @message = "create"
      @places = Place.new(params[:place])
      if @place.save
        redirect_to @place, :notice => "Sucessfully created place"
      else
        render :action => 'new'
      end
  end

  def show
    @message = "testing show"
      @places = Place.find(params[:id])
  end

  def edit
    @message = "testing create"
      @message = "edit"
      @place = Place.find(params[:id])
  end

  def update
      @message = "update"
  end

  def destroy
      @message = "destory"
  end
end
