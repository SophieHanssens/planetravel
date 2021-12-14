class PlanetsController < ApplicationController
  def index
    @planets = Planet.all
  end

  def new
    @planet = Planet.new
  end

  def create
    @planet = Planet.new(planet_params)
    @user = current_user.id
    @planet.user_id = @user
    if @planet.save!
      redirect_to planet_path(@planet)
    else
      render 'new'
    end
  end

  def show
    @planet = Planet.find(params[:id])
  end

  private

  def planet_params
    params.require(:planet).permit(:name, :address, :available_places, :price_per_night, :user_id)
  end

end
