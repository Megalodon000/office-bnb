class OfficesController < ApplicationController
  def index
    @offices = Office.all
    @users = User.all
  end

  def show
    @office = Office.find(params[:id])
  end

  def new
    @office = Office.new
  end

  def create
    @office = Office.new(office_params)
    if @office.save
      redirect_to office_path(@office)
    else
      render "new", status: :unprocessable_entity
    end
  end

  def destroy
    @office = Office.find(params[:id])
    @office.destroy
    redirect_to offices_path, status: :see_other
  end

  private

  def list_params
    params.require(:office).permit(:name, :email, :password)
  end

end
