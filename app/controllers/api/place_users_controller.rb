class Api::PlaceUsersController < ApplicationController
  helper_method :place, :context

  def build_resource
    @place_user = parent.place_users.build (resource_params.merge(user: current_user))
  end

  private
  def resource
    @place_user
  end

  def place
    @place ||= Place.find(params[:place_id])
  end

  def context
    @context
  end

  def collection
    if params[:user_id].present?
      @context = {user: true}
      @collection = PlaceUser.where(user_id: params[:user_id])
    elsif params[:place_id].present?
      @collection = Place.find (params[:place_id])
      # @collection = PlaceUser.where(place_id: params[:place_id])
      @context = {place: true}
    end
    @collection
  end

  def parent
    @parent ||= Place.find(params[:place_id])
  end

  def resource_params
    params.require(:place_user).permit(:rating)
  end
end
