class UsersController < ApplicationController
  before_action :set_users, only: %i[show edit update destroy]
  def index
    @users = User.all
  end

  def show
  end

  def new
    @users = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user, notice: "User created successefuly"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def destroy
    @user.destroy
    redirect_to @user, notice: "User was successsfully destroyed"
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: "user was successsfully updated"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
