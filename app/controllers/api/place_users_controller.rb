class Api::PlaceUsersController < ApplicationController
  def create
    PlaceUser.create(resource_params.merge(user: current_user, place: Place.find(params[:place_id])))
  end

  private
  def resource
    Place.find params[:place_id]
  end

  def resource_params
    params.require(:place_user).permit(:rating)
  end
end
