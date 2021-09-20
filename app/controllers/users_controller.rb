class UsersController < ApplicationController
  before_action :set_user, only:[:update,:show,:destroy,:edit]
  before_action :logged_in_user, only:[:index,:upate, :edit, :destroy]
  before_action :correct_user, only:[:update, :edit]
  before_action :admin_user, only:[:destroy]

  def index
    @users = User.paginate(page: params[:page])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
      if @user.save
        @user.send_activation_email
          flash[:info] = "Please check your email to activate your account."
          redirect_to root_url
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

  def destroy
    @user.destroy
    flash[:success] = "User deleted"
    redirect_to root_url
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def logged_in_user
    unless logged_in?
    store_location
    flash[:danger] = "Please Login Before"
    redirect_to login_path
    end
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to root_url unless current_user?(@user)
  end
    
  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
end
