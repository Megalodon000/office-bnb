class BookingsController < ApplicationController
  before_action :set_office, only: %i[new]
  before_action :set_booking, only: %i[destroy accept reject]

  def new
    @bookings = Booking.new
  end

  def accept
    @booking.confirmed!
    redirect_to dashboard_path, notice: 'the booking was accepted'
  end

  def reject
    @booking.canceled!
    redirect_to dashboard_path, notice: 'the booking was declined'
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    if @booking.save!
      redirect_to dashboard_path, notice: 'booking was successfully added.'
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
    @office = Office.find(params[:office_id])
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :office_id)
  end
end
