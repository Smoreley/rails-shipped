class UsersController < ApplicationController

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
    end

    def destroy
        @message = "destory"
    end

    private

    def user_params
       params.require(:user).permit(:name)
    end
end
