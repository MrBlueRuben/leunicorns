class BookingsController < ApplicationController
  before_action :set_booking, only: %i[new create update show edit destroy]

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.unicorn = @unicorn
    if @booking.save
      redirect_to list_path(@unicorn)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @bookings = Booking.all
  end

  def edit
  end

  def update
    @booking.update(booking_params)

    redirect_to booking_path(@booking)
  end

  def destroy
    @booking.destroy

    redirect_to list_path(@booking), notice: 'booking was successfully destroyed'
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:date, :unicorn_id, :user_id)
  end
end
