class Api::PlaceUsersController < ApplicationController
  def create
    PlaceUser.create (resource_params.merge(user: current_user,
                                                      place: Place.find(params[:place_id])))
  end

  private
  def resource
    Place.find params[:place_id]
  end

  def collection
    if params[:user_id].present?
      PlaceUser.where(user_id: params[:user_id])
    elsif params[:place_id].present?
      PlaceUser.where(place_id: params[:place_id])
    end
  end

  def resource_params
    params.require(:place_user).permit(:rating)
  end
end
