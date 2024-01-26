class OfficesController < ApplicationController
  def index
    if params[:search]
      @offices = Office.where('title LIKE ?', "%#{params[:search]}%")
    else
      @offices = Office.all
      @user = current_user
    end

  end

  def show
    @office = Office.find(params[:id])
    @booking = Booking.new
    @markers = [{
      lat: @office.latitude,
      lng: @office.longitude,
    }]
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
    params.require(:office).permit(:title, :description, :price, :photo, :address)
  end

end
