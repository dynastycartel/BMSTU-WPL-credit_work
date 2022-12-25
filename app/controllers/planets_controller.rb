class PlanetsController < ApplicationController
  include PlanetsHelper
  before_action :check_admin, only: %i[new create]

  def index
  end

  def new
  end

  def show
    @planet = Planet.find(params[:id])
    @want_to_visit_count = DesiredPlanet.where(planet_id: params[:id]).count
  end

  def create
    @planet = Planet.new(planet_params)
    unless @planet.valid?
      flash[:warning] = @planet.errors.full_messages.to_sentence
      redirect_to '/planets/new'
      return
    else
      @planet.save
      flash[:success] = 'Планета успешно добавлена.'
      redirect_to '/planets/new'
    end
  end

  def destroyy
    planet_to_destroy = Planet.find(params[:planet_id])
    desired_planet_to_destroy = DesiredPlanet.where(planet_id: params[:planet_id])
    desired_planet_to_destroy.destroy_all
    planet_to_destroy.destroy
    flash[:success] = 'Планета успешно удалена.'
    redirect_to home_path
  end

  private

  def planet_params
    params.permit(*%i[planet_name nearest_star_name distance_in_ly description picture free_space])
  end
end
