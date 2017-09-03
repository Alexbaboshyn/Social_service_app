class Api::PlacesController < ApplicationController

  helper_method :context

  private
  def resource
    Place.find( params[:id] )
  end

  def collection
    @places = PlaceSearcher.new(params).search
  end
end
