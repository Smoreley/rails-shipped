class PlaceController < ApplicationController
  def index
    @lplace.all
    if params[:search].present?
        @place = Place.near(params[:search], 50 :order => :distance)
      else
        @place = Place.all
  end

  def new
      @message = "new"
      @place = Place.new

  end

  def create
      @message = "create"
      @place = Place.new(params[:place])
      if @place.save
        redirect_to @place, :notice => "Sucessfully created place"
      else
        render :action => 'new'
      end
  end

  def show
      @place = Place.find(params[:id])
  end

  def edit
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
