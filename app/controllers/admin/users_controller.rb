class Admin::UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    id = params[:id]
    @user = User.find(id)
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to [:admin, User]
  end

  def get_user_params
    return :firstname, :name, :email, :password, :avatar
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes params[:user].permit(get_user_params)
    if @user.save
      redirect_to [:admin, @user]
    else
      render "edit"
    end
  end

  def create
    @user = User.new
    @user.update_attributes params[:user].permit(get_user_params)
    if @user.save
      redirect_to [:admin, @user]
    else
      render "new"
    end
  end
end
