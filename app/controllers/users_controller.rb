class UsersController < ApplicationController

    def base

    end

    def index
        @message = "index"
        @users = User.all

    end

    def new
        @message = "new"
        @new_user = User.create(params[:user])

    end

    def create
        @message = "create"
    end

    def show
        @message = "show"
        @user = User.find(params[:id])
    end

    def edit
        @message = "edit"
        @user = User.find(params[:id])
    end

    def update
        @message = "update"
        @user = User.find(params[:id])

        if @user.update_attributes(user_params)
            redirect_to url_for(:controller => :users, :action => :index)
        else
            render 'edit'
        end
    end

    def destroy
        @message = "destory"
        User.delete(params[:id])
        redirect_back(fallback_location: :back)
    end

    private

    def user_params
       params.require(:user).permit(:name, :email, :password, :password_confirmation) 
    end
end
