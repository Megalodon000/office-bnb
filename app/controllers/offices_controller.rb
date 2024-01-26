class OfficesController < ApplicationController
  def index
    @offices = Office.all
    @user = current_user
  end

  def show
    @office = Office.find(params[:id])
    @booking = Booking.new
  end

  def new
    @office = Office.new
  end

  def create
    @office = Office.new(office_params)
    @office.user = current_user
    if @office.save!
      redirect_to office_path(@office.id)
    else
      render "new", status: :unprocessable_entity
    end
  end

  def destroy
    @office = Office.find(params[:id])
    @office.destroy!
    redirect_to offices_path, status: :see_other
  end

  private

  def office_params
    params.require(:office).permit(:title, :description, :price, :photo)
  end

end
