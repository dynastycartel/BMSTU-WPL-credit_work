class DesiredPlanetsController < ApplicationController
  def create
    want_to_visit = DesiredPlanet.new(user_id: params[:user_id], planet_id: params[:planet_id])
    want_to_visit.save
    redirect_to '/planets/%d' % params[:planet_id]
  end

  def destroy
    dont_want_to_visit = DesiredPlanet.find_by(user_id: params[:user_id], planet_id: params[:planet_id])
    dont_want_to_visit.destroy
    redirect_to '/planets/%d' % params[:planet_id]
  end
end
