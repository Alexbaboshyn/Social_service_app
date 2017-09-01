class Api::PlacesController < ApplicationController
  private
  def resource
    Place.find( params[:id] )
  end

  def collection
    @places = PlaceSearcher.new(params).search
  end
end
