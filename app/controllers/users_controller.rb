class UsersController < ApplicationController
    before_action :set_user, only:[:update,:show,:destroy,:edit]

    def index
        @users = User.all
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
            if @user.save
                log_in @user
                flash[:success] = "Successfull to create"
                redirect_to @user
            else
                render 'new'
            end
    end

    def edit
    end

    def update
        if @user.update(user_params)
            flash[:success] = "Update Conplete"
            redirect_to @user
        else
            render 'edit'
        end
    end

    def show
        
    end

    private
    def set_user
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
    
end
