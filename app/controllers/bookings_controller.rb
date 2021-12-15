class BookingsController < ApplicationController
  def new
    @planet = Planet.find(params[:planet_id])
    @booking = Booking.new
    @user = current_user
  end

  def create
    @user = current_user
    @planet = Planet.find(params[:planet_id])

    @arrival = Date.parse(params[:booking][:arrival_date])
    @departure = Date.parse(params[:booking][:departure_date])
    @nb_days = @departure - @arrival
    @price = @nb_days * @planet.price_per_night

    @booking = Booking.new(booking_params)
    @booking.total_price = @price
    @booking.status = 'Pending'
    @booking.user_id = @user.id
    @booking.planet_id = @planet.id

    if @booking.save!
      redirect_to about_path
    else
      render 'new'
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
  end

  def accept

  end

  def reject

  end

  private

  def booking_params
    params.require(:booking).permit(:arrival_date, :departure_date, :total_price, :number_of_places, :status, :planet_id, :user_id)
  end
end
