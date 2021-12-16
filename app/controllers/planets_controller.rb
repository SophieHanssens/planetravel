class PlanetsController < ApplicationController
  before_action :set_planet, only: [:destroy, :show, :edit, :update]

  def index
    @planets = Planet.all
  end

  def new
    @planet = Planet.new
    authorize @planet
  end

  def create
    @planet = Planet.new(planet_params)
    @user = current_user.id
    @planet.user_id = @user
    authorize @planet
    if @planet.save!
      redirect_to planet_path(@planet)
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @planet.update!(planet_params)
      redirect_to planet_path(@planet)
    else
      render 'edit'
    end
  end

  def destroy
    @planet.destroy
    redirect_to planets_path
  end

  private

  def set_planet
    @planet = Planet.find(params[:id])
    authorize @planet
  end

  def planet_params
    params.require(:planet).permit(:name, :address, :available_places, :price_per_night, :user_id, :photo)
  end

end
