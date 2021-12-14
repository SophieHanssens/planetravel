class PagesController < ApplicationController
  def home

  end

  def about
    @user = current_user
    @bookings = Booking.where(@user.id == :user_id)
  end
end
