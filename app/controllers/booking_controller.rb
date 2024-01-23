class BookingController < ApplicationController
  before_action :set_office, only: %i[:new, :create]
  before_action :set_booking, only: %i[ destroy]

  def new
    @bookings = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.office = @office

    if @booking.save
      redirect_to office_path(@office), notice: 'booking was successfully added.'
    else
      render :new
    end
  end

  def destroy
    @booking.destroy
    redirect_to office_path(@booking.office), notice: 'booking was successfully removed.'
  end

  private

  def set_office
    @office = office.find(params[:office_id])
  end

  def set_booking
    @booking = booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
