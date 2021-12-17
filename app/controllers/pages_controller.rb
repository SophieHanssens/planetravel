class PagesController < ApplicationController
  def home

  end

  def about
    @user = current_user
    @requested_bookings = Booking.where(user:current_user)
    @bookings_on_my_planets = Booking.where(planet:current_user.planets)
    @planets = Planet.all
  end
end
